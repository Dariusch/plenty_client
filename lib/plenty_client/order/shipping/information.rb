# frozen_string_literal: true

module PlentyClient
  module Order
    module Shipping
      class Information
        include PlentyClient::Endpoint
        include PlentyClient::Request

        SINGLE_PATH               = '/orders/{orderId}/shipping/shipping_information'
        MULTIPLE_PATH             = '/orders/shipping/shipping_information'

        UPDATE_STATUS             = SINGLE_PATH + '/status'
        UPDATE_ADDITIONAL_DATA    = SINGLE_PATH + '/additional_data'

        class << self
          def list(order_id, headers = {}, &block)
            get(build_endpoint(SINGLE_PATH, order: order_id), headers, &block)
          end

          def create(body = {})
            post(MULTIPLE_PATH, body)
          end

          def update_status(order_id, body = {})
            put(build_endpoint(UPDATE_STATUS, order: order_id), body)
          end

          def update_data(order_id, body = {})
            put(build_endpoint(UPDATE_ADDITIONAL_DATA, order: order_id), body)
          end

          def destroy(order_id, body = {})
            delete(build_endpoint(SINGLE_PATH, order: order_id), body)
          end
        end
      end
    end
  end
end
