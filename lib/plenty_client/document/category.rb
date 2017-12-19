# frozen_string_literal: true

module PlentyClient
  module Document
    class Category
      include PlentyClient::Endpoint
      include PlentyClient::Request

      DOWNLOAD_CATEGORY_DOCUMENT  = '/categories/{categoryId}/documents/downloads'
      LIST_CATEGORY_DOCUMENTS     = '/categories/{categoryId}/documents/'
      UPLOAD_CATEGORY_DOCUMENT    = '/categories/{categoryId}/documents'
      DELTE_CATEGORY_DOCUMENTS    = '/categories/{categoryId}/documents/{documentId}'

      class << self
        def download(category_id, headers = {}, &block)
          get(build_endpoint(DOWNLOAD_CATEGORY_DOCUMENT, category: category_id), headers, &block)
        end

        def list(category_id, headers = {}, &block)
          get(build_endpoint(LIST_CATEGORY_DOCUMENTS, category: category_id), headers, &block)
        end

        def upload(category_id, body = {})
          post(build_endpoint(CREATE_CATEGORY_DOCUMENTS, category: category_id), body)
        end

        def destroy(category_id, body = {})
          delete(build_endpoint(DELTE_LISTINGS_category, category: category_id), body)
        end
      end
    end
  end
end
