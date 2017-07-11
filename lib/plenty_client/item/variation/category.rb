module PlentyClient
  module Item
    module Variation
      class Category
        include PlentyClient::Endpoint
        include PlentyClient::Request

        ITEM_VARIATION_CATEGORY_PATH    = '/items/{itemId}/variations/{variationId}'.freeze

        LIST_ITEM_VARIATIONS_CATEGORY   = '/variation_categories'.freeze
        GET_ITEM_VARIATIONS_CATEGORY    = '/variation_categories/{catId}'.freeze
        CREATE_ITEM_VARIATIONS_CATEGORY = '/variation_categories'.freeze
        UPDATE_ITEM_VARIATIONS_CATEGORY = '/variation_categories/{catId}'.freeze
        DELETE_ITEM_VARIATIONS_CATEGORY = '/variation_categories/{catId}'.freeze

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

          def update(item_id, variation_id, category_id, body = {})
            put(build_endpoint("#{ITEM_VARIATION_CATEGORY_PATH}#{CREATE_ITEM_VARIATIONS_CATEGORY}",
                                item: item_id,
                                variation: variation_id), body)
          end

          def destroy(item_id, variation_id, category_id)
            delete(build_endpoint("#{ITEM_VARIATION_CATEGORY_PATH}#{DELETE_ITEM_VARIATIONS_CATEGORY}",
                                  item: item_id,
                                  variation: variation_id,
                                  cat: category_id))
          end
        end
      end
    end
  end
end
