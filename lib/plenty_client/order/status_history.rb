# frozen_string_literal: true

module PlentyClient
  module Order
    module StatusHistory
      include PlentyClient::Endpoint
      include PlentyClient::Request

      FIND_ORDER_STATUS_HISTORY   = '/orders/{orderId}/status-history'
      LIST_ORDER_STATUS_HISTORIES = '/orders/status-history'

      class << self
        def find(order_id, headers = {}, &block)
          get(build_endpoint(FIND_ORDER_STATUS_HISTORY, order: order_id), headers, &block)
        end

        def list(headers = {}, &block)
          get(build_endpoint(LIST_ORDER_STATUS_HISTORIES), headers, &block)
        end
      end
    end
  end
end
