module PlentyClient
  module Order
    module CouponCode
      class Validation
        include PlentyClient::Endpoint
        include PlentyClient::Request

        VALIDATE_COUPON = '/orders/coupons/codes/{coupon}'.freeze

        class << self
          def update(coupon_string, headers = {}, &block)
            post(build_endpoint(VALIDATE_COUPON, coupon_string: coupon_string), headers, &block)
          end
        end
      end
    end
  end
end
