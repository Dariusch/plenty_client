module PlentyClient
  module Item
    module Attribute
      include PlentyClient::Endpoint
      include PlentyClient::Request

      CREATE_ATTRIBUTE  = '/items/attributes'.freeze
      LIST_ATTRIBUTES   = '/items/attributes'.freeze
      GET_ATTRIBUTE     = '/items/attributes/{attributeId}'.freeze
      UPDATE_ATTRIBUTE  = '/items/attributes/{attributeId}'.freeze
      DELETE_ATTRIBUTE  = '/items/attributes/{attributeId}'.freeze

      class << self
        def list(headers = {}, &block)
          get(build_endpoint(LIST_ATTRIBUTES), headers, &block)
        end

        def find(attribute_id, headers = {}, &block)
          get(build_endpoint(GET_ATTRIBUTE, attribute: attribute_id), headers, &block)
        end

        def create(headers = {})
          post(build_endpoint(CREATE_ATTRIBUTE), headers)
        end

        def update(attribute_id, headers = {})
          post(build_endpoint(UPDATE_ATTRIBUTE, attribute: attribute_id), headers)
        end

        def delete(attribute_id)
          delete(build_endpoint(DELETE_attribute, attribute: attribute_id))
        end
      end
    end
  end
end
