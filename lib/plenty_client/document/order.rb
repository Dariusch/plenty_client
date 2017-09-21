module PlentyClient
  module Document
    class Order
      include PlentyClient::Endpoint
      include PlentyClient::Request

      DOWNLOAD_ORDERS_DOCUMENTS         = '/orders/{orderId}/documents/downloads/{type}'.freeze
      DOWNLOAD_ORDER_DOCUMENTS_BY_TYPE  = '/orders/documents/downloads/{type}'.freeze
      LIST_ORDER_DOCUMENTS              = '/orders/{orderId}/documents/{type}'.freeze
      LIST_ORDER_DOCUMENTS_BY_TYPE      = '/orders/documents/{type}'.freeze
      UPLOAD_ORDER_DOCUMENT             = '/orders/{orderId}/documents/{type}'.freeze

      class << self
        def download(order_id, type_string, headers = {}, &block)
          get(build_endpoint(DOWNLOAD_ORDERS_DOCUMENTS, order: order_id, type_string: type_string), headers, &block)
        end

        def download_by_type(type_string, headers = {}, &block)
          get(build_endpoint(DOWNLOAD_ORDER_DOCUMENTS_BY_TYPE, type_string: type_string), headers, &block)
        end

        def list(order_id, type_sting = nil, headers = {}, &block)
          get(build_endpoint(LIST_ORDER_DOCUMENTS, order: order_id, type_sting: type_sting), headers, &block)
        end

        def list_by_type(order_id, type_sting = nil, headers = {}, &block)
          get(build_endpoint(LIST_ORDER_DOCUMENTS_BY_TYPE, order: order_id, type_sting: type_sting), headers, &block)
        end

        def upload(order_id, type_string, body = {})
          post(build_endpoint(UPLOAD_ORDER_DOCUMENT, order: order_id, type_string: type_string), body)
        end
      end
    end
  end
end
