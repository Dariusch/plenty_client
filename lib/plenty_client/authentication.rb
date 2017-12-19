# frozen_string_literal: true

module PlentyClient
  module Authentication
    include PlentyClient::Endpoint
    include PlentyClient::Request

    AUTH_LOGIN    = '/login'
    AUTH_REFRESH  = '/login/refresh'
    AUTH_TOKEN    = '/oauth/access_token'
    AUTH_LOGOUT   = '/logout'
    AUTH_CLIENT   = '/client-login'

    class << self
      def access_token(headers = {}, &block)
        get(build_endpoint(AUTH_TOKEN), headers, &block)
      end

      def login(body = {})
        post(build_endpoint(AUTH_LOGIN), body)
      end

      def login_refresh(body = {})
        post(build_endpoint(AUTH_REFRESH), body)
      end

      def logout(body = {})
        post(build_endpoint(AUTH_LOGOUT), body)
      end

      def client_access_token(body = {})
        post(build_endpoint(AUTH_CLIENT), body)
      end
    end
  end
end
