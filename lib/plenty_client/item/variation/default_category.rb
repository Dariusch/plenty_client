# frozen_string_literal: true

module PlentyClient
  module Item
    module Variation
      class DefaultCategory
        include PlentyClient::Endpoint
        include PlentyClient::Request

        ITEM_VARIATION_DEFAULT_CATEGORY_PATH    = '/items/{itemId}/variations/{variationId}'

        LIST_ITEM_VARIATIONS_DEFAULT_CATEGORY   = '/variation_default_categories'
        GET_ITEM_VARIATIONS_DEFAULT_CATEGORY    = '/variation_default_categories/{plentyId}'
        CREATE_ITEM_VARIATIONS_DEFAULT_CATEGORY = '/variation_default_categories'
        DELETE_ITEM_VARIATIONS_DEFAULT_CATEGORY = '/variation_default_categories/{plentyId}'

        class << self
          def list(item_id, variation_id, headers = {}, &block)
            get(build_endpoint("#{ITEM_VARIATION_DEFAULT_CATEGORY_PATH}#{LIST_ITEM_VARIATIONS_DEFAULT_CATEGORY}",
                               item: item_id,
                               variation: variation_id), headers, &block)
          end

          def find(item_id, variation_id, plenty_id, headers = {}, &block)
            get(build_endpoint("#{ITEM_VARIATION_DEFAULT_CATEGORY_PATH}#{GET_ITEM_VARIATIONS_DEFAULT_CATEGORY}",
                               item: item_id,
                               variation: variation_id,
                               plenty: plenty_id), headers, &block)
          end

          def create(item_id, variation_id, body = {})
            post(build_endpoint("#{ITEM_VARIATION_DEFAULT_CATEGORY_PATH}#{CREATE_ITEM_VARIATIONS_DEFAULT_CATEGORY}",
                                item: item_id,
                                variation: variation_id), body)
          end

          def destroy(item_id, variation_id, marketplace_id)
            delete(build_endpoint("#{ITEM_VARIATION_DEFAULT_CATEGORY_PATH}#{DELETE_ITEM_VARIATIONS_DEFAULT_CATEGORY}",
                                  item: item_id,
                                  variation: variation_id,
                                  marketplace: marketplace_id))
          end
        end
      end
    end
  end
end
