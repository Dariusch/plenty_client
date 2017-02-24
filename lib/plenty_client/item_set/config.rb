module PlentyClient
  module ItemSet
    class Config
      extend PlentyClient::Endpoint
      extend PlentyClient::Request
      FIND_ITEM_SET_CONFIGS   = '/item_sets/{itemSetId}/config'.freeze
      UPDATE_ITEM_SET_CONFIGS = '/item_sets/{itemSetId}/config'.freeze

      class << self
        def find(item_set_id, headers = {}, &block)
          get(build_endpoint(FIND_ITEM_SET_CONFIGS, item_set: item_set_id), headers, &block)
        end

        def update(item_set_id, body = {})
          put(build_endpoint(UPDATE_ITEM_SET_CONFIGS, item_set: item_set_id), body)
        end
      end
    end
  end
end
