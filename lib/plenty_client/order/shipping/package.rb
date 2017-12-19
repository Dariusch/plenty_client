# frozen_string_literal: true

module PlentyClient
  module Order
    module Shipping
      class Package
        include PlentyClient::Endpoint
        include PlentyClient::Request

        BASE_ORDERS_SHIPPING_PATH = '/orders/{orderId}/shipping'

        FIND_ORDERS_SHIPPING_PACKAGE    = '/packages/{orderShippingPackageId}'
        LIST_ORDERS_SHIPPING_PACKAGE    = '/packages'
        CREATE_ORDER_SHIPPING_PACKAGE   = '/packages'
        UPDATE_ORDER_SHIPPING_PACKAGE   = '/packages/{orderShippingPackageId}'
        DELETE_ORDER_SHIPPING_PACKAGE   = '/packages/{orderShippingPackageId}'
        DELETE_ORDER_SHIPPING_PACKAGES  = '/packages'

        class << self
          def list(order_id, headers = {}, &block)
            get(build_endpoint("#{BASE_ORDERS_SHIPPING_PATH}#{LIST_ORDERS_SHIPPING_PACKAGE}",
                               order: order_id), headers, &block)
          end

          def find(order_id, package_id, headers = {}, &block)
            get(build_endpoint("#{BASE_ORDERS_SHIPPING_PATH}#{FIND_ORDERS_SHIPPING_PACKAGE}",
                               order: order_id,
                               shipping_package: package_id), headers, &block)
          end

          def create(order_id, body = {})
            post(build_endpoint("#{BASE_ORDERS_SHIPPING_PATH}#{CREATE_ORDER_SHIPPING_PACKAGE}",
                                order: order_id), body)
          end

          def update(order_id, package_id, body = {})
            put(build_endpoint("#{BASE_ORDERS_SHIPPING_PATH}#{CREATE_ORDER_SHIPPING_PACKAGE}",
                               order: order_id,
                               shipping_package: package_id), body)
          end

          def destroy(order_id, package_id, body = {})
            delete(build_endpoint("#{BASE_ORDERS_SHIPPING_PATH}#{DELETE_ORDER_SHIPPING_PACKAGE}",
                                  order: order_id,
                                  shipping_package: package_id), body)
          end

          def destroy_all(order_id, body = {})
            delete(build_endpoint("#{BASE_ORDERS_SHIPPING_PATH}#{DELETE_ORDER_SHIPPING_PACKAGES}",
                                  order: order_id), body)
          end
        end
      end
    end
  end
end
