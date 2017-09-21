

/orders/{orderId}/documents/downloads/{type?} Download documents of an order
/orders/documents/downloads/{type} Download documents of a document type
/orders/{orderId}/documents/{type?} List documents of an order
/orders/documents/{type} List documents of a type
/orders/{orderId}/documents/{type} Upload order documents

/documents/{documentId} Download the content of a document

module PlentyClient
  module Document
    include PlentyClient::Endpoint
    include PlentyClient::Request

    DOWNLOAD_DOCUMENT = '/documents/{documentId}'.freeze

    class << self
      def download(document_id, headers = {}, &block)
        get(build_endpoint(FIND_LISTING, download: document_id), headers, &block)
      end
    end
  end
end
