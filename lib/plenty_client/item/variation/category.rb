# frozen_string_literal: true

module PlentyClient
  module Item
    module Variation
      class Category
        include PlentyClient::Endpoint
        include PlentyClient::Request

        ITEM_VARIATION_CATEGORY_PATH    = '/items/{itemId}/variations/{variationId}'

        LIST_ITEM_VARIATIONS_CATEGORY   = '/variation_categories'
        GET_ITEM_VARIATIONS_CATEGORY    = '/variation_categories/{catId}'
        CREATE_ITEM_VARIATIONS_CATEGORY = '/variation_categories'
        UPDATE_ITEM_VARIATIONS_CATEGORY = '/variation_categories/{catId}'
        DELETE_ITEM_VARIATIONS_CATEGORY = '/variation_categories/{catId}'

        MASS_CATEGORY_ASSIGNMENT        = '/items/variations/variation_categories'

        class << self
          def list(item_id, variation_id, headers = {}, &block)
            get(build_endpoint("#{ITEM_VARIATION_CATEGORY_PATH}#{LIST_ITEM_VARIATIONS_CATEGORY}",
                               item: item_id,
                               variation: variation_id), headers, &block)
          end

          def find(item_id, variation_id, category_id, headers = {}, &block)
            get(build_endpoint("#{ITEM_VARIATION_CATEGORY_PATH}#{GET_ITEM_VARIATIONS_CATEGORY}",
                               item: item_id,
                               variation: variation_id,
                               cat: category_id), headers, &block)
          end

          def create(item_id, variation_id, body = {})
            post(build_endpoint("#{ITEM_VARIATION_CATEGORY_PATH}#{CREATE_ITEM_VARIATIONS_CATEGORY}",
                                item: item_id,
                                variation: variation_id), body)
          end

          def bulk_assign(body)
            post(MASS_CATEGORY_ASSIGNMENT, body)
          end

          def update(item_id, variation_id, category_id, body = {})
            put(build_endpoint("#{ITEM_VARIATION_CATEGORY_PATH}#{UPDATE_ITEM_VARIATIONS_CATEGORY}",
                               item: item_id, variation: variation_id, cat: category_id),
                body)
          end

          def destroy(item_id, variation_id, category_id)
            delete(build_endpoint("#{ITEM_VARIATION_CATEGORY_PATH}#{DELETE_ITEM_VARIATIONS_CATEGORY}",
                                  item: item_id, variation: variation_id, cat: category_id))
          end
        end
      end
    end
  end
end
