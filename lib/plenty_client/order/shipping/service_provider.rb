# frozen_string_literal: true

module PlentyClient
  module Order
    module Shipping
      class ServiceProvider
        include PlentyClient::Endpoint
        include PlentyClient::Request

        BASE_ORDERS_SHIPPING_SERVICE_PROVIDER_PATH = '/orders/shipping'

        LIST_ORDERS_SHIPPING_SERVICE_PROVIDER = '/shipping_service_providers'
        FIND_ORDER_SHIPPING_SERVICE_PROVIDER  = '/shipping_service_providers/{shippingServiceProviderID}'

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
