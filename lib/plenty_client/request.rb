require 'curl'
module PlentyClient
  module Request
    module ClassMethods
      def request(http_method, path, params = {})
        return false if http_method.nil? || path.nil?
        return false unless %w[post put patch delete get].include?(http_method.to_s)

        if PlentyClient::Config.access_token.nil? || time_diff_ms(Time.now, PlentyClient::Config.expiry_date).negative?
          login_check
        end
        start_time = Time.now
        response = perform(http_method, path, params)
        body = parse_body(response, http_method, path, params)
        log_output(http_method, base_url(path), params, time_diff_ms(start_time, Time.now)) if PlentyClient::Config.log
        body
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

      def get(path, params = {}, &block)
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
        url = "/login?username=#{PlentyClient::Config.api_user}&password=#{PlentyClient::Config.api_password}"
        response = perform(:post, url)
        result = parse_body(response, :post, 'login')
        PlentyClient::Config.access_token  = result['accessToken']
        PlentyClient::Config.refresh_token = result['refreshToken']
        PlentyClient::Config.expiry_date   = Time.now + result['expiresIn']
      end

      def perform(http_method, path, params = {})
        case http_method.to_s.downcase
        when 'get'
          Curl.get(base_url(path), params) do |curl|
            curl_options(curl)
          end
        when 'post'
          Curl.post(base_url(path), params.to_json) do |curl|
            curl_options(curl)
          end
        when 'put'
          Curl.put(base_url(path), params.to_json) do |curl|
            curl_options(curl)
          end
        when 'delete'
          Curl.delete(base_url(path), params) do |curl|
            curl_options(curl)
          end
        when 'patch'
          Curl.patch(base_url(path), params.to_json) do |curl|
            curl_options(curl)
          end
        end
      end

      def curl_options(curl)
        curl.headers['Content-type'] = 'application/json'
        unless PlentyClient::Config.access_token.nil?
          curl.headers['Authorization'] = "Bearer #{PlentyClient::Config.access_token}"
        end
        curl.headers['Accept'] = 'application/x.plentymarkets.v1+json'
        curl
      end

      def base_url(path)
        uri = URI(PlentyClient::Config.site_url)
        url = "#{uri.scheme}://#{uri.host}/rest"
        url += path.start_with?('/') ? path : "/#{path}"
        url
      end

      def parse_body(response, http_method, rest_path, params = {})
        result = JSON.parse(response.body)
        errors = error_check(result)
        raise PlentyMarketsResponseError.new(errors, http_method, rest_path, params) unless errors.blank?
        result
      end

      def log_output(http_method, path, params, duration)
        puts [Time.now, "#{duration} ms", http_method.upcase, path, params].join(' # ')
      end

      def time_diff_ms(start, finish)
        ((finish - start) * 1000.0).round(2)
      end

      def error_check(response)
        rval = []
        if response.is_a?(Array) && !response.blank? && response.first.key?('error')
          response.each do |res|
            rval << extract_message(res)
          end
        elsif response.is_a?(Hash) && response&.key?('error')
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

class PlentyMarketsResponseError < StandardError
  def initialize(errors, http_method, rest_path, params)
    super("#{errors.join(', ')}, http_Method: #{http_method}, path: #{rest_path}, options: #{params}")
  end
end
