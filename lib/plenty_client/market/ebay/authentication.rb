# frozen_string_literal: true

module PlentyClient
  module Market
    module Ebay
      class Authentication
        include PlentyClient::Endpoint
        include PlentyClient::Request

        FIND_MARKET_EBAY_AUTH_URL       = '/markets/ebay/auth/login'
        REFRESH_MARKET_EBAY_AUTH_TOKEN  = '/markets/ebay/auth/refresh-token'

        class << self
          def find_login_url(headers = {}, &block)
            get(build_endpoint(FIND_MARKET_EBAY_AUTH_URL), headers, &block)
          end

          def refrest_token(body = {})
            put(build_endpoint(REFRESH_MARKET_EBAY_AUTH_TOKEN), body)
          end
        end
      end
    end
  end
end
