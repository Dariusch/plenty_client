# frozen_string_literal: true

module PlentyClient
  module Order
    module ContactWish
      include PlentyClient::Endpoint
      include PlentyClient::Request

      FIND_ORDER_CONTACT_WISH = '/orders/{orderId}/contactWish'

      class << self
        def find(order_id, headers = {}, &block)
          get(build_endpoint(FIND_ORDER_CONTACT_WISH, order: order_id), headers, &block)
        end
      end
    end
  end
end
