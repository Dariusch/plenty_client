module PlentyClient
  module Basket
    extend PlentyClient::Endpoint
    extend PlentyClient::Request

    FIND_BASKET = '/basket'.freeze

    class << self
      def find(headers = {}, &block)
        get(build_endpoint(FIND_BASKET), headers, &block)
      end
    end
  end
end
