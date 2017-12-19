# frozen_string_literal: true

module PlentyClient
  module Payment
    class Order
      include PlentyClient::Endpoint
      include PlentyClient::Request

      LIST_ORDERS_PAYMENTS          = '/payments/orders/{orderId}'
      CREATE_PAYMENT_ORDER_RELATION = '/payment/{paymentId}/order/{orderId}'
      DELETE_ORDERS_PAYMENT         = '/payment/{paymentId}/order'

      class << self
        def list(order_id, headers = {}, &block)
          get(build_endpoint(LIST_ORDERS_PAYMENTS, order: order_id), headers, &block)
        end

        def create(payment_id, order_id, body = {})
          post(build_endpoint(CREATE_PAYMENT_ORDER_RELATION, payment: payment_id, order: order_id), body)
        end

        def destroy(payment_id, body = {})
          delete(build_endpoint(DELETE_ORDERS_PAYMENT, payment: payment_id), body)
        end

        # def update(payment_id, body = {})
        #   post(build_endpoint(UPDATE_PAYMENT_PROPERTY_WITH_ID, payment: payment_id), body)
        # end
      end
    end
  end
end
