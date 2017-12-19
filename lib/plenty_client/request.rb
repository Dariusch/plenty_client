require 'typhoeus'
require 'typhoeus/adapters/faraday'

module PlentyClient
  module Request
    module ClassMethods
      def request(http_method, path, params = {})
        return false if http_method.nil? || path.nil?
        return false unless %w[post put patch delete get].include?(http_method.to_s)

        login_check unless PlentyClient::Config.tokens_valid?

        params = stringify_symbol_keys(params)

        attempts = PlentyClient::Config.attempt_count
        attempts.times do
          response = perform(http_method, path, params)
          return response if response
        end
        raise PlentyClient::AttemptsExceeded, "unable to get valid response after #{attempts} attempts"
      end

      def post(path, body = {})
        request(:post, path, body)
      end

      def put(path, body = {})
        request(:put, path, body)
      end

      def patch(path, body = {})
        request(:patch, path, body)
      end

      def delete(path, body = {})
        request(:delete, path, body)
      end

      def get(path, params = {})
        page = 1
        rval_array = []
        if block_given?
          loop do
            response = request(:get, path, params.merge('page' => page))
            yield response['entries']
            break if response['isLastPage'] == true
            page += 1
          end
        else
          rval_array = request(:get, path, { 'page' => page }.merge(params))
        end
        return rval_array.flatten if rval_array.is_a?(Array)
        rval_array
      end

      private

      def stringify_symbol_keys(hash)
        new_hash = {}
        hash.each do |k, v|
          k = k.to_s if k.is_a?(Symbol)
          new_hash[k] = v
        end
        new_hash
      end

      def login_check
        PlentyClient::Config.validate_credentials
        result = perform(:post, '/login', username: PlentyClient::Config.api_user,
                                          password: PlentyClient::Config.api_password)
        PlentyClient::Config.access_token  = result['accessToken']
        PlentyClient::Config.refresh_token = result['refreshToken']
        PlentyClient::Config.expiry_date   = Time.now + result['expiresIn']
      end

      def perform(http_method, path, params = {})
        conn = Faraday.new(url: PlentyClient::Config.site_url) do |faraday|
          faraday = headers(faraday)
          if PlentyClient::Config.log
            faraday.response :logger do |logger|
              logger.filter(/password=([^&]+)/, 'password=[FILTERED]')
            end
          end
        end
        conn.adapter :typhoeus
        verb = http_method.to_s.downcase
        params = params.to_json unless %w[get delete].include?(verb)
        response = conn.send(verb, base_url(path), params)
        parse_body(response)
      end

      def headers(adapter)
        adapter.headers['Content-type'] = 'application/json'
        unless PlentyClient::Config.access_token.nil?
          adapter.headers['Authorization'] = "Bearer #{PlentyClient::Config.access_token}"
        end
        adapter.headers['Accept'] = 'application/x.plentymarkets.v1+json'
        adapter
      end

      def base_url(path)
        uri = URI(PlentyClient::Config.site_url)
        url = "#{uri.scheme}://#{uri.host}/rest"
        url += path.start_with?('/') ? path : "/#{path}"
        url
      end

      # 2017-12-04 DO: there has to be a supervisor watching over the users limits
      #                BEFORE the request actually happens
      #                response_header is after the request and useless if you have multiple instances of the Client
      def throttle_check_short_period(response_header)
        short_calls_left = response_header['X-Plenty-Global-Short-Period-Calls-Left']
        short_seconds_left = response_header['X-Plenty-Global-Short-Period-Decay']
        return if short_calls_left&.empty? || short_seconds_left&.empty?
        sleep(short_seconds_left.to_i + 1) if short_calls_left.to_i <= 10 && short_seconds_left.to_i < 3
      end

      def parse_body(response)
        content_type = response.env.response_headers['Content-Type']
        case content_type
        when %r{application/json}
          json = JSON.parse(response.body)
          errors = error_check(json)
          raise PlentyClient::ResponseError, errors if errors && !errors&.empty?
          json
        when %r{application/pdf}
          response.body
        end
      rescue JSON::ParserError
        raise PlentyClient::ResponseError, 'invalid response'
      end

      def error_check(response)
        return if response.nil? || response&.empty?
        response = response.first if response.is_a?(Array)
        return unless response&.key?('error')
        check_for_invalid_credentials(response)
        extract_message(response)
      end

      def check_for_invalid_credentials(response)
        raise PlentyClient::Config::InvalidCredentials if response['error'] == 'invalid_credentials'
      end

      def extract_message(response)
        if response.key?('validation_errors') && response['validation_errors'] && !response['validation_errors']&.empty?
          errors = response['validation_errors']
          rval = errors.values         if response['validation_errors'].is_a?(Hash)
          rval = errors.flatten.values if response['validation_errors'].is_a?(Array)
          rval.flatten.join(', ')
        else
          response.dig('error', 'message')
        end
      end
    end

    def self.included(base)
      base.extend(ClassMethods)
    end
  end
end
