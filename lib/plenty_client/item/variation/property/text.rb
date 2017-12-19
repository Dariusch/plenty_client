# frozen_string_literal: true

module PlentyClient
  module Item
    module Variation
      module Property
        class Text
          include PlentyClient::Endpoint
          include PlentyClient::Request

          VARIATION_PROPERTY_TEXT_BASE_PATH   = '/items/{itemId}/variations/{variationId}'

          GET_VARIATION_PROPERTY_TEXT         = '/variation_properties/{propertyId}/texts'
          GET_VARIATION_PROPERTY_TEXT_BY_LANG = '/variation_properties/{propertyId}/texts/{lang}'
          CREATE_VARIATION_PROPERTY_TEXT      = '/variation_properties/{propertyId}/texts'
          UPDATE_VARIATION_PROPERTY_TEXT      = '/variation_properties/{propertyId}/texts/{lang}'
          DELETE_VARIATION_PROPERTY_TEXT      = '/variation_properties/{propertyId}/texts/{lang}'

          class << self
            def find(item_id, variation_id, property_id, headers = {}, &block)
              get(build_endpoint("#{VARIATION_PROPERTY_TEXT_BASE_PATH}#{GET_VARIATION_PROPERTY_TEXT}",
                                 item: item_id, variation: variation_id, property: property_id), headers, &block)
            end

            def find_by_language(item_id, variation_id, property_id, lang, headers = {}, &block)
              get(build_endpoint("#{VARIATION_PROPERTY_TEXT_BASE_PATH}#{GET_VARIATION_PROPERTY_TEXT_BY_LANG}",
                                 item: item_id, variation: variation_id, property: property_id, lang: lang),
                  headers, &block)
            end

            def create(item_id, variation_id, property_id, headers = {})
              post(build_endpoint("#{VARIATION_PROPERTY_TEXT_BASE_PATH}#{CREATE_VARIATION_PROPERTY_TEXT}",
                                  item: item_id, variation: variation_id, property: property_id), headers)
            end

            def update(item_id, variation_id, property_id, lang, headers = {})
              put(build_endpoint("#{VARIATION_PROPERTY_TEXT_BASE_PATH}#{UPDATE_VARIATION_PROPERTY_TEXT}",
                                 item: item_id, variation: variation_id, property: property_id, lang: lang),
                  headers)
            end

            def destroy(item_id, variation_id, property_id, lang)
              delete(build_endpoint("#{VARIATION_PROPERTY_TEXT_BASE_PATH}#{DELETE_VARIATION_PROPERTY_TEXT}",
                                    item: item_id, variation: variation_id, property: property_id, lang: lang))
            end
          end
        end
      end
    end
  end
end
