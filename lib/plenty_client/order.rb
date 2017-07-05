module PlentyClient
  module Order
    include PlentyClient::Endpoint
    include PlentyClient::Request

    CREATE_ORDER                = '/orders'.freeze
    LIST_ORDERS                 = '/orders'.freeze
    FIND_ORDER                  = '/orders/{orderId}'.freeze
    LIST_CONTACTS_ORDERS        = '/orders/contacts/{contactId}'.freeze
    UPDATE_ORDER                = '/orders/{orderId}'.freeze
    LIST_ORDERS_PACKAGE_NUMBERS = '/orders/{orderId}/packagenumbers'.freeze
    DELETE_ORDER                = '/orders/{orderId}'.freeze

    class << self
      def create(body = {})
        post(build_endpoint(CREATE_ORDER), body)
      end

      def list(headers = {}, &block)
        get(build_endpoint(LIST_ORDERS), headers, &block)
      end

      def list_contacts_orders(contact_id, headers = {}, &block)
        get(build_endpoint(LIST_CONTACTS_ORDERS, contact: contact_id), headers, &block)
      end
      def list_contacts_orders(order_id, headers = {}, &block)
        get(build_endpoint(LIST_ORDERS_PACKAGE_NUMBERS, order: order_id), headers, &block)
      end

      def find(order_id = nil, headers = {}, &block)
        get(build_endpoint(FIND_ORDER, order: order_id), headers, &block)
      end

      def update(order_id, body = {})
        put(build_endpoint(UPDATE_ORDER, order: order_id), body)
      end

      def delete(order_id, body = {})
        delete(build_endpoint(DELETE_ORDER, order: order_id), body)
      end
    end
  end
end
