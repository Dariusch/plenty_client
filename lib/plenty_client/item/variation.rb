module PlentyClient
  module Item
    module Variation
      extend PlentyClient::Endpoint
      extend PlentyClient::Request
      ALL_VARIATIONS          = '/items/variations'.freeze
      DELETE_ITEMS_VARIATION  = '/items/{itemId}/variations/{variationId}'.freeze
      GET_ITEMS_VARIATION     = '/items/{itemId}/variations/{variationId}'.freeze
      GET_ITEMS_VARIATIONS    = '/items/{itemId}/variations'.freeze
      POST_ITEMS_VARIATION    = '/items/{itemId}/variations'.freeze

      class << self
        def all(headers = {}, &block)
          get(ALL_VARIATIONS, headers, &block)
        end

        def find(item_id, variation_id, headers = {}, &block)
          get(build_endpoint(GET_ITEMS_VARIATION, item: item_id, variation: variation_id), headers, &block)
        end

        def list(item_id, headers = {}, &block)
          get(build_endpoint(GET_ITEMS_VARIATIONS, item: item_id), headers, &block)
        end

        def update(item_id, body = {})
          post(build_endpoint(POST_ITEMS_VARIATION, item: item_id), body)
        end

        def delete(item_id, variation_id)
          delete(build_endpoint(DELETE_ITEMS_VARIATION, item: item_id, variation: variation_id))
        end
      end
    end
  end
end
