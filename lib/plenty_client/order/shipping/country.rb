module PlentyClient
  module Order
    module Shipping
      class Country
        extend PlentyClient::Endpoint
        extend PlentyClient::Request

        LIST_SHIPPING_COUNTRIES = '/orders/shipping/countries'.freeze

        class << self
          def list(headers = {}, &block)
            get(build_endpoint(LIST_SHIPPING_COUNTRIES), headers, &block)
          end
        end
      end
    end
  end
end
