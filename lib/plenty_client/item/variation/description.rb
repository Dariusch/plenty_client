module PlentyClient
  module Item
    module Variation
      class Description
        include PlentyClient::Endpoint
        include PlentyClient::Request

        ITEM_VARIATION_DESCRIPTION_BASE_PATH  = '/items/{itemId}/variations/{variationId}'.freeze

        LIST_ITEM_VARIATION_DESCRIPTIONS      = '/descriptions'.freeze
        GET_ITEM_VARIATIONS_DESCRIPTION       = '/descriptions/{lang}'.freeze
        CREATE_ITEM_VARIATIONS_DESCRIPTION    = '/descriptions'.freeze
        UPDATE_ITEM_VARIATIONS_DESCRIPTION    = '/descriptions/{lang}'.freeze
        DELETE_ITEM_VARIATIONS_DESCRIPTION    = '/descriptions/{lang}'.freeze

        class << self
          def list(item_id, variation_id, headers = {}, &block)
            get(build_endpoint("#{ITEM_VARIATION_DESCRIPTION_BASE_PATH}#{LIST_ITEM_VARIATION_DESCRIPTIONS}",
                               item: item_id,
                               variation: variation_id), headers, &block)
          end

          def find(item_id, variation_id, lang, headers = {})
            get(build_endpoint("#{ITEM_VARIATION_DESCRIPTION_BASE_PATH}#{GET_ITEM_VARIATIONS_DESCRIPTION}",
                               item: item_id,
                               variation: variation_id,
                               lang: lang), headers, &block)
          end

          def create(item_id, variation_id, body = {})
            post(build_endpoint("#{ITEM_VARIATION_DESCRIPTION_BASE_PATH}#{CREATE_ITEM_VARIATIONS_DESCRIPTION}",
                                item: item_id,
                                variation: variation_id), body)
          end

          def update(item_id, variation_id, lang, body = {})
            put(build_endpoint("#{ITEM_VARIATION_DESCRIPTION_BASE_PATH}#{UPDATE_ITEM_VARIATIONS_DESCRIPTION}",
                               item: item_id,
                               variation: variation_id,
                               lang: lang), body)
          end

          def delete(item_id, variation_id, lang)
            delete(build_endpoint("#{ITEM_VARIATION_DESCRIPTION_BASE_PATH}#{DELETE_ITEM_VARIATIONS_DESCRIPTION}",
                                  item: item_id,
                                  variation: variation_id,
                                  lang: lang))
          end
        end
      end
    end
  end
end
