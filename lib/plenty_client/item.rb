module PlentyClient
  module Item
    include PlentyClient::Endpoint
    include PlentyClient::Request

    LIST_ITEMS    = '/items'.freeze
    CREATE_ITEM   = '/items'.freeze
    GET_ITEM      = '/items/{itemId}'.freeze

    class << self
      def list(headers = {}, &block)
        get(build_endpoint(LIST_ITEMS), headers, &block)
      end

      def find(item_id = nil, headers = {}, &block)
        get(build_endpoint(GET_ITEM, item: item_id), headers, &block)
      end

      def create(body = {})
        post(CREATE_ITEM, body)
      end
    end
  end
end
