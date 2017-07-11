module PlentyClient
  module Item
    class VariationPropertyValue
      include PlentyClient::Endpoint
      include PlentyClient::Request

      VARIATION_PROPERTY_VALUE_BASE_PATH = '/items/{itemId}/variation_properties/{variationId}'.freeze

      LIST_ALL_VARIATION_PROPERTY_VALUES = '/values'.freeze
      GET_VARIATION_PROPERTY_VALUES      = '/values/{propertyId}'.freeze
      CREATE_VARIATION_PROPERTY_VALUES   = '/values'.freeze
      UPDATE_VARIATION_PROPERTY_VALUES   = '/values/{propertyId}'.freeze
      DELETE_VARIATION_PROPERTY_VALUES   = '/values/{propertyId}'.freeze

      class << self
        def list(headers = {}, &block)
          get(build_endpoint("#{VARIATION_PROPERTY_VALUE_BASE_PATH}#{LIST_ALL_VARIATION_PROPERTY_VALUES}"),
              headers, &block)
        end

        def find(item_id, variation_id, property_id, headers = {}, &block)
          get(build_endpoint("#{VARIATION_PROPERTY_VALUE_BASE_PATH}#{GET_VARIATION_PROPERTY}",
                             item: item_id, variation: variation_id, property: property_id),
              headers, &block)
        end

        def create(body = {})
          post(build_endpoint("#{VARIATION_PROPERTY_VALUE_BASE_PATH}#{CREATE_VARIATION_PROPERTY_VALUES}"), body)
        end

        def update(item_id, variation_id, property_id, body = {})
          put(build_endpoint("#{VARIATION_PROPERTY_VALUE_BASE_PATH}#{UPDATE_VARIATION_PROPERTY_VALUES}",
                             item: item_id, variation: variation_id, property: property_id),
              body)
        end

        def destroy(item_id, variation_id, property_id)
          delete(build_endpoint("#{VARIATION_PROPERTY_VALUE_BASE_PATH}#{DELETE_VARIATION_PROPERTY_VALUES}",
                                item: item_id, variation: variation_id, property: property_id))
        end
      end
    end
  end
end
