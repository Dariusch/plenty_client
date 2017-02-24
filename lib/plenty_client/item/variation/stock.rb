module PlentyClient
  module Item
    module Variation
      class Stock
        extend PlentyClient::Endpoint
        extend PlentyClient::Request

        ITEM_VARIATION_STOCK_PATH    = '/items/{itemId}/variations/{variationId}'.freeze

        LIST_ITEM_VARIATIONS_STOCK                    = '/stock'.freeze
        LIST_ITEM_VARIATIONS_STOCK_STORAGE_LOCATIONS  = '/stock/storageLocations'.freeze
        LIST_ITEM_VARIATIONS_STOCK_MOVEMENTS          = '/stock/movements'.freeze
        UPDATE_ITEM_VARIATIONS_STOCK_INCOMING_ITEMS   = '/stock/bookIncomingItems'.freeze
        UPDATE_ITEM_VARIATIONS_STOCK_CORRECTION       = '/stock/correction'.freeze
        UPDATE_ITEM_VARIATIONS_STOCK_REDISTRIBUTE     = '/stock/redistribute'.freeze

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
            put(build_endpoint("#{ITEM_VARIATION_STOCK_PATH}#{UPDATE_ITEM_VARIATIONS_STOCK_INCOMING_ITEMS}",
                               item: item_id,
                               variation: variation_id), body)
          end

          def update_rediestributions(item_id, variation_id, body = {})
            put(build_endpoint("#{ITEM_VARIATION_STOCK_PATH}#{UPDATE_ITEM_VARIATIONS_STOCK_INCOMING_ITEMS}",
                               item: item_id,
                               variation: variation_id), body)
          end
        end
      end
    end
  end
end
