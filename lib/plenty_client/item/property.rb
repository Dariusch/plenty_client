module PlentyClient
  module Item
    module Property
      include PlentyClient::Endpoint
      include PlentyClient::Request

      LIST_ALL_PROPERTIES = '/items/properties'.freeze
      GET_PROPERTY        = '/items/properties/{propertyId}'.freeze
      CREATE_PROPERTY     = '/items/properties'.freeze
      UPDATE_PROPERTY     = '/items/properties/{propertyId}'.freeze
      DELETE_PROPERTY     = '/items/properties/{propertyId}'.freeze

      class << self
        def list(headers = {}, &block)
          get(build_endpoint(LIST_ALL_PROPERTIES), headers, &block)
        end

        def find(property_id, headers = {}, &block)
          get(build_endpoint(GET_PROPERTY, property: property_id), headers, &block)
        end

        def create(headers = {})
          post(build_endpoint(CREATE_PROPERTY), headers)
        end

        def update(property_id, headers = {})
          put(build_endpoint(UPDATE_PROPERTY, property: property_id), headers)
        end

        def delete(property_id)
          delete(build_endpoint(DELETE_PROPERTY, property: property_id))
        end
      end
    end
  end
end
