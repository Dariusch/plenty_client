# frozen_string_literal: true

module PlentyClient
  module Document
    class Order
      include PlentyClient::Endpoint
      include PlentyClient::Request

      DOWNLOAD_ORDERS_DOCUMENTS         = '/orders/{orderId}/documents/downloads/{type}'
      DOWNLOAD_ORDER_DOCUMENTS_BY_TYPE  = '/orders/documents/downloads/{type}'
      LIST_ORDER_DOCUMENTS              = '/orders/{orderId}/documents/{type}'
      LIST_ORDER_DOCUMENTS_BY_TYPE      = '/orders/documents/{type}'
      UPLOAD_ORDER_DOCUMENT             = '/orders/{orderId}/documents/{type}'

      class << self
        def download(order_id, type_string, headers = {}, &block)
          get(build_endpoint(DOWNLOAD_ORDERS_DOCUMENTS, order: order_id, type_string: type_string), headers, &block)
        end

        def download_by_type(type_string, headers = {}, &block)
          get(build_endpoint(DOWNLOAD_ORDER_DOCUMENTS_BY_TYPE, type_string: type_string), headers, &block)
        end

        def list(order_id, type_string = nil, headers = {}, &block)
          get(build_endpoint(LIST_ORDER_DOCUMENTS, order: order_id, type_string: type_string), headers, &block)
        end

        def list_by_type(type_string = nil, headers = {}, &block)
          get(build_endpoint(LIST_ORDER_DOCUMENTS_BY_TYPE, type_string: type_string), headers, &block)
        end

        def upload(order_id, type_string, body = {})
          post(build_endpoint(UPLOAD_ORDER_DOCUMENT, order: order_id, type_string: type_string), body)
        end
      end
    end
  end
end
