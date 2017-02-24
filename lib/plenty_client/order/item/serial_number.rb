module PlentyClient
  module Order
    module Item
      class SerialNumber
        extend PlentyClient::Endpoint
        extend PlentyClient::Request

        LIST_SERIAL_NUMBERS             = '/orders/{orderId}/items/serialNumbers'.freeze
        LIST_ORDER_ITEM_SERIAL_NUMBERS  = '/orders/{orderId}/items/{orderItemId}/serialNumbers'.freeze
      
        class << self
          def list(order_id, headers = {}, &block)
            get(build_endpoint(LIST_SERIAL_NUMBERS, order: order_id), headers, &block)
          end

          def find(order_id, order_item_id, headers = {}, &block)
            get(build_endpoint(LIST_ORDER_ITEM_SERIAL_NUMBERS,
                               order: order_id,
                               order_item: order_item_id), headers, &block)
          end
        end
      end
    end
  end
end
