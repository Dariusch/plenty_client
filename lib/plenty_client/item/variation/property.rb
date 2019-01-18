# frozen_string_literal: true

module PlentyClient
  module Item
    module Variation
      module Property
        include PlentyClient::Endpoint
        include PlentyClient::Request

        BASE_PATH     = '/items/{itemId}/variations/{variationId}/variation_properties'
        SINGULAR_PATH = BASE_PATH + '/{propertyId}'
        BULK_PATH     = '/items/variations/variation_properties'

        class << self
          def list(item_id, variation_id, headers = {}, &block)
            get(build_endpoint(BASE_PATH, item: item_id, variation: variation_id), headers, &block)
          end

          def find(item_id, variation_id, property_id, headers = {}, &block)
            get(build_endpoint(SINGULAR_PATH, item: item_id, variation: variation_id, property: property_id), headers, &block)
          end

          def create(item_id, variation_id, headers = {})
            post(build_endpoint(BASE_PATH, item: item_id, variation: variation_id), headers)
          end

          def update(item_id, variation_id, property_id, headers = {})
            put(build_endpoint(SINGULAR_PATH, item: item_id, variation: variation_id, property: property_id), headers)
          end

          def destroy(item_id, variation_id, property_id)
            delete(build_endpoint(SINGULAR_PATH, item: item_id, variation: variation_id, property: property_id))
          end

          def bulk_create(body = {})
            post(BULK_PATH, body)
          end

          def bulk_update(body = {})
            put(BULK_PATH, body)
          end

          def destroy_all(item_id, variation_id)
            delete(build_endpoint(BASE_PATH, item: item_id, variation: variation_id))
          end
        end
      end
    end
  end
end
