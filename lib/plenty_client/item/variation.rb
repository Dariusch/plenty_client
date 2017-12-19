# frozen_string_literal: true

module PlentyClient
  module Item
    module Variation
      include PlentyClient::Endpoint
      include PlentyClient::Request

      ALL_VARIATIONS          = '/items/variations'
      DELETE_ITEMS_VARIATION  = '/items/{itemId}/variations/{variationId}'
      GET_ITEMS_VARIATION     = '/items/{itemId}/variations/{variationId}'
      GET_ITEMS_VARIATIONS    = '/items/{itemId}/variations'
      POST_ITEMS_VARIATION    = '/items/{itemId}/variations'
      UPDATE_ITEMS_VARIATION  = '/items/{itemId}/variations/{variationId}'

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

        def create(item_id, body = {})
          post(build_endpoint(POST_ITEMS_VARIATION, item: item_id), body)
        end

        def update(item_id, variation_id, body = {})
          put(build_endpoint(UPDATE_ITEMS_VARIATION, item: item_id, variation: variation_id), body)
        end

        def destroy(item_id, variation_id)
          delete(build_endpoint(DELETE_ITEMS_VARIATION, item: item_id, variation: variation_id))
        end
      end
    end
  end
end
