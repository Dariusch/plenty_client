module PlentyClient
  module Item
    class PropertyGroup
      extend PlentyClient::Endpoint
      extend PlentyClient::Request

      LIST_ALL_PROPERTY_GROUPS  = '/items/property_groups'.freeze
      GET_PROPERTY_GROUP        = '/items/property_groups/{propertyGroupId}'.freeze
      CREATE_PROPERTY_GROUP     = '/items/property_groups'.freeze
      UPDATE_PROPERTY_GROUP     = '/items/property_groups/{propertyGroupId}'.freeze
      DELETE_PROPERTY_GROUP     = '/items/property_groups/{propertyGroupId}'.freeze

      class << self
        def list(headers = {}, &block)
          get(build_endpoint(LIST_ALL_PROPERTY_GROUPS), headers, &block)
        end

        def find(property_group_id, headers = {}, &block)
          get(build_endpoint(GET_PROPERTY_GROUP, property_group: property_group_id), headers, &block)
        end

        def create(body = {})
          post(build_endpoint(CREATE_PROPERTY_GROUP), body)
        end

        def update(property_group_id, body = {})
          put(build_endpoint(UPDATE_PROPERTY_GROUP, property_group: property_group_id), body)
        end

        def delete(property_group_id)
          delete(build_endpoint(DELETE_PROPERTY_GROUP, property_group: property_group_id))
        end
      end
    end
  end
end
