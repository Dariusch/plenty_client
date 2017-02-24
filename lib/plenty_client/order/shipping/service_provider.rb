module PlentyClient
  module Order
    module Shipping
      class ServiceProvider
        extend PlentyClient::Endpoint
        extend PlentyClient::Request

        BASE_ORDERS_SHIPPING_SERVICE_PROVIDER_PATH = '/orders/shipping'.freeze

        LIST_ORDERS_SHIPPING_SERVICE_PROVIDER = '/shipping_service_providers'.freeze
        FIND_ORDER_SHIPPING_SERVICE_PROVIDER  = '/shipping_service_providers/{shippingServiceProviderID}'.freeze

        class << self
          def list(headers = {}, &block)
            get(build_endpoint("#{BASE_ORDERS_SHIPPING_SERVICE_PROVIDER_PATH}#{LIST_ORDERS_SHIPPING_SERVICE_PROVIDER}"),
                headers, &block)
          end

          def find(service_provider_id, headers = {}, &block)
            get(build_endpoint("#{BASE_ORDERS_SHIPPING_SERVICE_PROVIDER_PATH}#{FIND_ORDER_SHIPPING_SERVICE_PROVIDER}",
                               shipping_service_provider: service_provider_id), headers, &block)
          end
        end
      end
    end
  end
end
