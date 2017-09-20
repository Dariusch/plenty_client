require 'typhoeus'
require 'typhoeus/adapters/faraday'

module PlentyClient
  module Request
    module ClassMethods
      def request(http_method, path, params = {})
        return false if http_method.nil? || path.nil?
        return false unless %w(post put patch delete get).include?(http_method.to_s)

        if PlentyClient::Config.access_token.nil? || (PlentyClient::Config.expiry_date - Time.now).negative?
          login_check
        end
        parse_body(perform(http_method, path, params))
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
            response = request(:get, path, params.merge(page: page))
            yield response['entries'] if block_given?
            page += 1
            break if response['isLastPage'] == true
          end
        else
          rval_array = request(:get, path, params.merge(page: page))
        end
        return rval_array.flatten if rval_array.is_a?(Array)
        rval_array
      end

      private

      def login_check
        response = perform(:post, '/login', username: PlentyClient::Config.api_user,
                                            password: PlentyClient::Config.api_password)
        result = parse_body(response)
        PlentyClient::Config.access_token  = result['accessToken']
        PlentyClient::Config.refresh_token = result['refreshToken']
        PlentyClient::Config.expiry_date   = Time.now + result['expiresIn']
      end

      def perform(http_method, path, params = {})
        conn = Faraday.new(url: PlentyClient::Config.site_url) do |faraday|
          faraday = headers(faraday)
          if PlentyClient::Config.log
            faraday.response :logger do |logger|
              logger.filter(/(password=)(\w+)/, '\1[FILTERED]')
            end
          end
        end
        conn.adapter :typhoeus
        converted_parameters = %w(get delete).include?(http_method.to_s.downcase) ? params : params.to_json
        conn.send(http_method.to_s.downcase, base_url(path), converted_parameters)
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

      def parse_body(response)
        result = JSON.parse(response.body)
        errors = error_check(result)
        raise PlentyClient::ResponseError, [*errors].join(', ') unless errors.blank?
        result
      end

      def error_check(response)
        rval = []
        return rval if response.blank?
        if response.is_a?(Array) && response.first.key?('error')
          response.each do |res|
            rval << extract_message(res)
          end
        elsif response.is_a?(Hash) && response.key?('error')
          rval << extract_message(response)
        end
        rval
      end

      def extract_message(response)
        if response.key?('validation_errors') && !response['validation_errors'].blank?
          response['validation_errors'].values.flatten.join(', ')
        else
          response['error']['message']
        end
      end
    end

    def self.included(base)
      base.extend(ClassMethods)
    end
  end
end
