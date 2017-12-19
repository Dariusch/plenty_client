# frozen_string_literal: true

module PlentyClient
  module ItemSet
    include PlentyClient::Endpoint
    include PlentyClient::Request

    LIST_ITEM_SETS    = '/item_sets'
    GET_ITEM_SET      = '/item_sets/{itemSetId}'
    CREATE_ITEM_SETS  = '/item_sets'
    UPDATE_ITEM_SET   = '/item_sets/{itemSetId}'
    UPDATE_ITEM_SETS  = '/item_sets'
    DELETE_ITEM_SET   = '/item_sets/{itemSetId}'
    DELETE_ITEM_SETS  = '/item_sets'

    class << self
      def list(headers = {}, &block)
        get(build_endpoint(LIST_ITEM_SETS), headers, &block)
      end

      def find(item_set_id, headers = {}, &block)
        get(build_endpoint(GET_ITEM_SET, item_set: item_set_id), headers, &block)
      end

      def create(body = {})
        post(build_endpoint(CREATE_ITEM_SETS), body)
      end

      def update(item_set_id, body = {})
        put(build_endpoint(UPDATE_ITEM_SET, item_set: item_set_id), body)
      end

      def update_sets(body = {})
        put(build_endpoint(UPDATE_ITEM_SETS), body)
      end

      def destroy(item_set_id, body = {})
        put(build_endpoint(DELETE_ITEM_SET, item_set: item_set_id), body)
      end

      def destroy_sets(body = {})
        put(build_endpoint(DELETE_ITEM_SETS), body)
      end
    end
  end
end
