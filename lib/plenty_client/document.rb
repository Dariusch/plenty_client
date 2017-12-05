module PlentyClient
  module Document
    include PlentyClient::Endpoint
    include PlentyClient::Request

    DOWNLOAD_DOCUMENT = '/documents/{documentId}'.freeze

    class << self
      def download(document_id, headers = {}, &block)
        get(build_endpoint(DOWNLOAD_DOCUMENT, document: document_id), headers, &block)
      end
    end
  end
end
