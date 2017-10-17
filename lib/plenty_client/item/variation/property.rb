module PlentyClient
  module Item
    module Variation
      module Property
        include PlentyClient::Endpoint
        include PlentyClient::Request

        VARIATION_PROPERTY_BASE_PATH  = '/items/{itemId}/variations/{variationId}'.freeze

        LIST_ALL_VARIATION_PROPERTIES = '/variation_properties'.freeze
        GET_VARIATION_PROPERTY        = '/variation_properties/{propertyId}'.freeze
        CREATE_VARIATION_PROPERTY     = '/variation_properties'.freeze
        UPDATE_VARIATION_PROPERTY     = '/variation_properties/{propertyId}'.freeze
        DELETE_VARIATION_PROPERTY     = '/variation_properties/{propertyId}'.freeze

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
