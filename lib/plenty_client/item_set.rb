module PlentyClient
  module ItemSet
    include PlentyClient::Endpoint
    include PlentyClient::Request

    LIST_ITEM_SETS    = '/item_sets'.freeze
    GET_ITEM_SET      = '/item_sets/{itemSetId}'.freeze
    CREATE_ITEM_SETS  = '/item_sets'.freeze
    UPDATE_ITEM_SET   = '/item_sets/{itemSetId}'.freeze
    UPDATE_ITEM_SETS  = '/item_sets'.freeze
    DELETE_ITEM_SET   = '/item_sets/{itemSetId}'.freeze
    DELETE_ITEM_SETS  = '/item_sets'.freeze

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
