# frozen_string_literal: true

module PlentyClient
  module ItemSet
    class Config
      include PlentyClient::Endpoint
      include PlentyClient::Request

      FIND_ITEM_SET_CONFIGS   = '/item_sets/{itemSetId}/config'
      UPDATE_ITEM_SET_CONFIGS = '/item_sets/{itemSetId}/config'

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
