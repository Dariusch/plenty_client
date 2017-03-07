module PlentyClient
  module Comment
    extend PlentyClient::Endpoint
    extend PlentyClient::Request

    FIND_COMMENT    = '/comments/{commentId}'.freeze
    LIST_COMMENTS   = '/comments/{referenceType}/{referenceValue}'.freeze
    CREATE_COMMENT  = '/comments'.freeze
    DELETE_COMMENT  = '/comments/{commentId}'.freeze

    class << self
      def list(reference_type, reference_value, headers = {}, &block)
        get(build_endpoint(LIST_COMMENTS,
                           reference_type: reference_type,
                           reference_value: reference_value), headers, &block)
      end

      def find(comment_id, headers = {}, &block)
        get(build_endpoint(FIND_COMMENT, comment: comment_id), headers, &block)
      end

      def create(body = {})
        post(CREATE_CATEGORY, body)
      end

      def delete(cat_id, body = {})
        delete(build_endpoint(DELETE_CATEGORY, comment: cat_id), body)
      end
    end
  end
end
