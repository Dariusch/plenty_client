# frozen_string_literal: true

module PlentyClient
  module Order
    module Item
      include PlentyClient::Endpoint
      include PlentyClient::Request

      DELETE_ORDERS_ORDER_ITEM = '/orders/{orderId}/items/{orderItemId}'

      class << self
        def destroy(order_id, order_item_id)
          delete(build_endpoint(DELETE_ORDERS_ORDER_ITEM,
                                order: order_id,
                                order_item: order_item_id))
        end
      end
    end
  end
end
