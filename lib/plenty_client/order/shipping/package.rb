module PlentyClient
  module Order
    module Shipping
      class Package
        extend PlentyClient::Endpoint
        extend PlentyClient::Request

        BASE_ORDERS_SHIPPING_PATH = '/orders/{orderId}/shipping'.freeze

        FIND_ORDERS_SHIPPING_PACKAGE    = '/packages/{orderShippingPackageId}'.freeze
        LIST_ORDERS_SHIPPING_PACKAGE    = '/packages'.freeze
        CREATE_ORDER_SHIPPING_PACKAGE   = '/packages'.freeze
        UPDATE_ORDER_SHIPPING_PACKAGE   = '/packages/{orderShippingPackageId}'.freeze
        DELETE_ORDER_SHIPPING_PACKAGE   = '/packages/{orderShippingPackageId}'.freeze
        DELETE_ORDER_SHIPPING_PACKAGES  = '/packages'.freeze

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

          def delete(order_id, package_id, body = {})
            delete(build_endpoint("#{BASE_ORDERS_SHIPPING_PATH}#{DELETE_ORDER_SHIPPING_PACKAGE}",
                                  order: order_id,
                                  shipping_package: package_id), body)
          end

          def delete_all(order_id, body = {})
            delete(build_endpoint("#{BASE_ORDERS_SHIPPING_PATH}#{DELETE_ORDER_SHIPPING_PACKAGES}",
                                  order: order_id), body)
          end
        end
      end
    end
  end
end
