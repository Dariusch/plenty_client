# frozen_string_literal: true

module PlentyClient
  module Item
    module Variation
      class Stock
        include PlentyClient::Endpoint
        include PlentyClient::Request

        ITEM_VARIATION_STOCK_PATH = '/items/{itemId}/variations/{variationId}'

        LIST_ITEM_VARIATIONS_STOCK                    = '/stock'
        LIST_ITEM_VARIATIONS_STOCK_STORAGE_LOCATIONS  = '/stock/storageLocations'
        LIST_ITEM_VARIATIONS_STOCK_MOVEMENTS          = '/stock/movements'
        UPDATE_ITEM_VARIATIONS_STOCK_INCOMING_ITEMS   = '/stock/bookIncomingItems'
        UPDATE_ITEM_VARIATIONS_STOCK_CORRECTION       = '/stock/correction'
        UPDATE_ITEM_VARIATIONS_STOCK_REDISTRIBUTE     = '/stock/redistribute'

        class << self
          def list(item_id, variation_id, headers = {}, &block)
            get(build_endpoint("#{ITEM_VARIATION_STOCK_PATH}#{LIST_ITEM_VARIATIONS_STOCK}",
                               item: item_id,
                               variation: variation_id), headers, &block)
          end

          def list_storage_locations(item_id, variation_id, headers = {}, &block)
            get(build_endpoint("#{ITEM_VARIATION_STOCK_PATH}#{LIST_ITEM_VARIATIONS_STOCK_STORAGE_LOCATIONS}",
                               item: item_id,
                               variation: variation_id), headers, &block)
          end

          def list_stock_movements(item_id, variation_id, headers = {}, &block)
            get(build_endpoint("#{ITEM_VARIATION_STOCK_PATH}#{LIST_ITEM_VARIATIONS_STOCK_MOVEMENTS}",
                               item: item_id,
                               variation: variation_id), headers, &block)
          end

          def update_incoming_items(item_id, variation_id, body = {})
            put(build_endpoint("#{ITEM_VARIATION_STOCK_PATH}#{UPDATE_ITEM_VARIATIONS_STOCK_INCOMING_ITEMS}",
                               item: item_id,
                               variation: variation_id), body)
          end

          def update_corrections(item_id, variation_id, body = {})
            put(build_endpoint("#{ITEM_VARIATION_STOCK_PATH}#{UPDATE_ITEM_VARIATIONS_STOCK_CORRECTION}",
                               item: item_id,
                               variation: variation_id), body)
          end

          def update_redistributions(item_id, variation_id, body = {})
            put(build_endpoint("#{ITEM_VARIATION_STOCK_PATH}#{UPDATE_ITEM_VARIATIONS_STOCK_REDISTRIBUTE}",
                               item: item_id,
                               variation: variation_id), body)
          end
        end
      end
    end
  end
end
