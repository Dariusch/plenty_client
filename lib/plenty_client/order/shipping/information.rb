# frozen_string_literal: true

module PlentyClient
  module Order
    module Shipping
      class Information
        include PlentyClient::Endpoint
        include PlentyClient::Request

        BASE_ORDERS_SHIPPING_INFORMATION_PATH = '/orders/{orderId}/shipping'

        LIST_ORDERS_SHIPPING_INFORMATION  = '/shipping_information'
        DELETE_ORDER_SHIPPING_INFORMATION = '/shipping_information'
        CREATE_ORDER_SHIPPING_INFORMATION = '/shipping_information'
        UPDATE_ORDER_SHIPPING_STATUS      = '/shipping_information/status'
        UPDATE_ORDER_SHIPPING_DATA        = '/shipping_information/additional_data'

        class << self
          def list(order_id, headers = {}, &block)
            get(build_endpoint("#{BASE_ORDERS_SHIPPING_INFORMATION_PATH}#{LIST_ORDERS_SHIPPING_INFORMATION}",
                               order: order_id), headers, &block)
          end

          def create(order_id, body = {})
            post(build_endpoint("#{BASE_ORDERS_SHIPPING_INFORMATION_PATH}#{CREATE_ORDER_SHIPPING_INFORMATION}",
                                order: order_id), body)
          end

          def update_status(body = {})
            put(UPDATE_ORDER_SHIPPING_STATUS, body)
          end

          def update_data(body = {})
            put(UPDATE_ORDER_SHIPPING_DATA, body)
          end

          def destroy(order_id, body = {})
            delete(build_endpoint("#{BASE_ORDERS_SHIPPING_INFORMATION_PATH}#{DELETE_ORDER_SHIPPING_INFORMATION}",
                                  order: order_id), body)
          end
        end
      end
    end
  end
end
