module PlentyClient
  module Order
    module Shipping
      class Information
        extend PlentyClient::Endpoint
        extend PlentyClient::Request

        BASE_ORDERS_SHIPPING_INFORMATION_PATH = '/orders/{orderId}/shipping'.freeze

        LIST_ORDERS_SHIPPING_INFORMATION  = '/shipping_information'.freeze
        DELETE_ORDER_SHIPPING_INFORMATION = '/shipping_information'.freeze
        CREATE_ORDER_SHIPPING_INFORMATION = '/shipping_information'.freeze
        UPDATE_ORDER_SHIPPING_STATUS      = '/shipping_information/status'.freeze
        UPDATE_ORDER_SHIPPING_DATA        = '/shipping_information/additional_data'.freeze

        class << self
          def list(order_id, headers = {}, &block)
            get(build_endpoint("#{BASE_ORDERS_SHIPPING_INFORMATION_PATH}#{LIST_ORDERS_SHIPPING_INFORMATION}",
                               order: order_id), headers, &block)
          end

          def create(order_id, body = {})
            post(build_endpoint("#{BASE_ORDERS_SHIPPING_INFORMATION_PATH}#{CREATE_ORDER_SHIPPING_INFORMATION}",
                                order: order_id), body)
          end

          def update_status(order_id, body = {})
            put(build_endpoint("#{BASE_ORDERS_SHIPPING_INFORMATION_PATH}#{UPDATE_ORDER_SHIPPING_STATUS}",
                               order: order_id), body)
          end

          def update_data(order_id, body = {})
            put(build_endpoint("#{BASE_ORDERS_SHIPPING_INFORMATION_PATH}#{UPDATE_ORDER_SHIPPING_DATA}",
                               order: order_id), body)
          end

          def delete(order_id, body = {})
            delete(build_endpoint("#{BASE_ORDERS_SHIPPING_INFORMATION_PATH}#{DELETE_ORDER_SHIPPING_INFORMATION}",
                                  order: order_id), body)
          end
        end
      end
    end
  end
end
