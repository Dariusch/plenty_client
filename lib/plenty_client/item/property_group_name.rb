module PlentyClient
  module Item
    class PropertyGroupName
      include PlentyClient::Endpoint
      include PlentyClient::Request

      PROPERTY_GROUP_BASE_PATH        = 'items/property_groups/{propertyGroupId}'.freeze

      LIST_ALL_PROPERTY_GROUP_NAMES   = '/names'.freeze
      GET_PROPERTY_GROUP_NAMES        = '/names/{lang}'.freeze
      CREATE_PROPERTY_GROUP_NAMES     = '/names'.freeze
      UPDATE_PROPERTY_GROUP_NAMES     = '/names/{lang}'.freeze
      DELETE_PROPERTY_GROUP_NAMES     = '/names/{lang}'.freeze

      class << self
        def list(headers = {}, &block)
          get(build_endpoint("#{PROPERTY_GROUP_BASE_PATH}#{LIST_ALL_PROPERTY_GROUP_NAMES}"), headers, &block)
        end

        def find(property_group_id, lang, headers = {}, &block)
          get(build_endpoint("#{PROPERTY_GROUP_BASE_PATH}#{GET_PROPERTY_GROUP_NAMES}",
                             property_group: property_group_id, lang: lang),
              headers, &block)
        end

        def create(headers = {})
          post(build_endpoint("#{PROPERTY_GROUP_BASE_PATH}#{CREATE_PROPERTY_GROUP_NAMES}"), headers)
        end

        def update(property_group_id, lang, headers = {})
          put(build_endpoint("#{PROPERTY_GROUP_BASE_PATH}#{UPDATE_PROPERTY_GROUP_NAMES}",
                             property_group: property_group_id, lang: lang), headers)
        end

        def destroy(property_group_id, lang)
          delete(build_endpoint("#{PROPERTY_GROUP_BASE_PATH}#{DELETE_PROPERTY_GROUP_NAMES}",
                                property_group: property_group_id, lang: lang))
        end
      end
    end
  end
end
