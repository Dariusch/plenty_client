# frozen_string_literal: true

module PlentyClient
  module Item
    module Variation
      module Property
        include PlentyClient::Endpoint
        include PlentyClient::Request

        VARIATION_PROPERTY_BASE_PATH  = '/items/{itemId}/variations/{variationId}/variation_properties'
        SINGLE_PROPERTY_PATH          = VARIATION_PROPERTY_BASE_PATH + '/{propertyId}'

        class << self
          def list(item_id, variation_id, headers = {}, &block)
            get(build_endpoint(VARIATION_PROPERTY_BASE_PATH, item: item_id, variation: variation_id), headers, &block)
          end

          def create(item_id, variation_id, headers = {})
            post(build_endpoint(VARIATION_PROPERTY_BASE_PATH, item: item_id, variation: variation_id), headers)
          end

          def destroy_all(item_id, variation_id)
            delete(build_endpoint(VARIATION_PROPERTY_BASE_PATH, item: item_id, variation: variation_id))
          end

          def find(item_id, variation_id, property_id, headers = {}, &block)
            get(build_endpoint(SINGLE_PROPERTY_PATH,
                               item: item_id, variation: variation_id, property: property_id), headers, &block)
          end

          def update(item_id, variation_id, property_id, headers = {})
            put(build_endpoint(SINGLE_PROPERTY_PATH,
                               item: item_id, variation: variation_id, property: property_id), headers)
          end

          def destroy(item_id, variation_id, property_id)
            delete(build_endpoint(SINGLE_PROPERTY_PATH,
                                  item: item_id, variation: variation_id, property: property_id))
          end
        end
      end
    end
  end
end
