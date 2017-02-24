module PlentyClient
  module Order
    module ContactWish
      extend PlentyClient::Endpoint
      extend PlentyClient::Request

      FIND_ORDER_COTACT_WISH = '/orders/{orderId}/contactWish'.freeze

      class << self
        def find(order_id, headers = {}, &block)
          get(build_endpoint(FIND_ORDER_COTACT_WISH, order: order_id), headers, &block)
        end
      end
    end
  end
end

