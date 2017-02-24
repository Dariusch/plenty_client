module PlentyClient
  module Order
    module Item
      extend PlentyClient::Endpoint
      extend PlentyClient::Request

      DELETE_ORDERS_ORDER_ITEM = '/orders/{orderId}/items/{orderItemId}'.freeze

      class << self
        def delete(order_id, order_item_id)
          delete(build_endpoint(DELETE_ORDERS_ORDER_ITEM,
                                order: order_id,
                                order_item: order_item_id))
        end
      end
    end
  end
end
