# frozen_string_literal: true

module PlentyClient
  module Item
    module Variation
      module Property
        include PlentyClient::Endpoint
        include PlentyClient::Request

        VARIATION_PROPERTY_BASE_PATH  = '/items/{itemId}/variations/{variationId}'

        LIST_ALL_VARIATION_PROPERTIES = '/variation_properties'
        GET_VARIATION_PROPERTY        = '/variation_properties/{propertyId}'
        CREATE_VARIATION_PROPERTY     = '/variation_properties'
        UPDATE_VARIATION_PROPERTY     = '/variation_properties/{propertyId}'
        DELETE_VARIATION_PROPERTY     = '/variation_properties/{propertyId}'

        class << self
          def list(item_id, variation_id, headers = {}, &block)
            get(build_endpoint("#{VARIATION_PROPERTY_BASE_PATH}#{LIST_ALL_VARIATION_PROPERTIES}",
                               item: item_id, variation: variation_id), headers, &block)
          end

          def find(item_id, variation_id, property_id, headers = {}, &block)
            get(build_endpoint("#{VARIATION_PROPERTY_BASE_PATH}#{GET_VARIATION_PROPERTY}",
                               item: item_id, variation: variation_id, property: property_id), headers, &block)
          end

          def create(item_id, variation_id, headers = {})
            post(build_endpoint("#{VARIATION_PROPERTY_BASE_PATH}#{CREATE_VARIATION_PROPERTY}",
                                item: item_id, variation: variation_id), headers)
          end

          def update(item_id, variation_id, property_id, headers = {})
            put(build_endpoint("#{VARIATION_PROPERTY_BASE_PATH}#{UPDATE_VARIATION_PROPERTY}",
                               item: item_id, variation: variation_id, property: property_id), headers)
          end

          def destroy(item_id, variation_id, property_id)
            delete(build_endpoint("#{VARIATION_PROPERTY_BASE_PATH}#{DELETE_VARIATION_PROPERTY}",
                                  item: item_id, variation: variation_id, property: property_id))
          end
        end
      end
    end
  end
end
