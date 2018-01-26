# frozen_string_literal: true

module PlentyClient
  module Comment
    include PlentyClient::Endpoint
    include PlentyClient::Request

    FIND_COMMENT    = '/comments/{commentId}'
    LIST_COMMENTS   = '/comments/{referenceType}/{referenceValue}'
    CREATE_COMMENT  = '/comments'
    DELETE_COMMENT  = '/comments/{commentId}'

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
        post(CREATE_COMMENT, body)
      end

      def destroy(cat_id, body = {})
        delete(build_endpoint(DELETE_COMMENT, comment: cat_id), body)
      end
    end
  end
end
