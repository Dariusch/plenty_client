module PlentyClient
  module Item
    class VariationProperty
      extend PlentyClient::Endpoint
      extend PlentyClient::Request

      LIST_ALL_VARIATION_PROPERTIES = '/items/{itemId}/variation_properties'.freeze
      GET_VARIATION_PROPERTY        = '/items/{itemId}/variation_properties/{variationId}'.freeze
      CREATE_VARIATION_PROPERTY     = '/items/{itemId}/variation_properties'.freeze
      UPDATE_VARIATION_PROPERTY     = '/items/{itemId}/variation_properties/{variationId}'.freeze
      DELETE_VARIATION_PROPERTY     = '/items/{itemId}/variation_properties/{variationId}'.freeze

      class << self
        def list(headers = {}, &block)
          get(build_endpoint(LIST_ALL_VARIATION_PROPERTIES), headers, &block)
        end

        def find(item_id, variation_id, headers = {}, &block)
          get(build_endpoint(GET_VARIATION_PROPERTY, item: item_id, variation: variation_id), headers, &block)
        end

        def create(headers = {})
          post(build_endpoint(CREATE_VARIATION_PROPERTY), headers)
        end

        def update(item_id, variation_id, headers = {})
          put(build_endpoint(UPDATE_VARIATION_PROPERTY, item: item_id, variation: variation_id), headers)
        end

        def delete(item_id, variation_id)
          delete(build_endpoint(DELETE_VARIATION_PROPERTY, item: item_id, variation: variation_id))
        end
      end
    end
  end
end
