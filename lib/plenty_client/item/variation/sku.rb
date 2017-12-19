# frozen_string_literal: true

module PlentyClient
  module Item
    module Variation
      class Sku
        include PlentyClient::Endpoint
        include PlentyClient::Request

        ITEM_VARIATION_SKU_PATH    = '/items/{itemId}/variations/{variationId}'

        LIST_ITEM_VARIATIONS_SKU   = '/variation_skus'
        GET_ITEM_VARIATIONS_SKU    = '/variation_skus/{skuId}'
        CREATE_ITEM_VARIATIONS_SKU = '/variation_skus'
        UPDATE_ITEM_VARIATIONS_SKU = '/variation_skus/{skuId}'
        DELETE_ITEM_VARIATIONS_SKU = '/variation_skus/{skuId}'

        class << self
          def list(item_id, variation_id, headers = {}, &block)
            get(build_endpoint("#{ITEM_VARIATION_SKU_PATH}#{LIST_ITEM_VARIATIONS_SKU}",
                               item: item_id, variation: variation_id),
                headers, &block)
          end

          def find(item_id, variation_id, sku_id, headers = {}, &block)
            get(build_endpoint("#{ITEM_VARIATION_SKU_PATH}#{GET_ITEM_VARIATIONS_SKU}",
                               item: item_id, variation: variation_id, sku: sku_id),
                headers, &block)
          end

          def create(item_id, variation_id, body = {})
            post(build_endpoint("#{ITEM_VARIATION_SKU_PATH}#{CREATE_ITEM_VARIATIONS_SKU}",
                                item: item_id, variation: variation_id),
                 body)
          end

          def update(item_id, variation_id, sku_id, body = {})
            put(build_endpoint("#{ITEM_VARIATION_SKU_PATH}#{CREATE_ITEM_VARIATIONS_SKU}",
                               item: item_id, variation: variation_id, sku: sku_id),
                body)
          end

          def destroy(item_id, variation_id, sku_id)
            delete(build_endpoint("#{ITEM_VARIATION_SKU_PATH}#{DELETE_ITEM_VARIATIONS_SKU}",
                                  item: item_id, variation: variation_id, sku: sku_id))
          end
        end
      end
    end
  end
end
