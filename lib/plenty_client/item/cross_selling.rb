# frozen_string_literal: true

module PlentyClient
  module Item
    class CrossSelling
      include PlentyClient::Endpoint
      include PlentyClient::Request

      CREATE_ITEMS_CROSS_SELLING = '/items/{itemId}/item_cross_selling'
      GET_ITEMS_CROSS_SELLING    = '/items/{itemId}/item_cross_selling'
      DELETE_ITEMS_CROSS_SELLING = '/items/{itemId}/item_cross_selling/{crossItemId}'

      class << self
        def create(item_id, headers = {})
          post(build_endpoint(CREATE_ITEMS_CROSS_SELLING, item: item_id), headers)
        end

        def list(item_id, headers = {}, &block)
          get(build_endpoint(GET_ITEMS_CROSS_SELLING, item: item_id), headers, &block)
        end

        def destroy(item_id, cross_item_id)
          delete(build_endpoint(DELETE_ITEMS_CROSS_SELLING, item: item_id, cross_item: cross_item_id))
        end
      end
    end
  end
end
