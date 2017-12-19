# frozen_string_literal: true

module PlentyClient
  module Order
    module CouponCode
      include PlentyClient::Endpoint
      include PlentyClient::Request

      UPDATE_COUPON_CODE = '/orders/{orderId}/coupons/{coupon}'

      class << self
        def update(order_id, coupon_string, headers = {}, &block)
          post(build_endpoint(UPDATE_COUPON_CODE, order: order_id, coupon_string: coupon_string),
               headers, &block)
        end
      end
    end
  end
end
