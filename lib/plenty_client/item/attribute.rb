# frozen_string_literal: true

module PlentyClient
  module Item
    module Attribute
      include PlentyClient::Endpoint
      include PlentyClient::Request

      CREATE_ATTRIBUTE  = '/items/attributes'
      LIST_ATTRIBUTES   = '/items/attributes'
      GET_ATTRIBUTE     = '/items/attributes/{attributeId}'
      UPDATE_ATTRIBUTE  = '/items/attributes/{attributeId}'
      DELETE_ATTRIBUTE  = '/items/attributes/{attributeId}'

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

        def destroy(attribute_id)
          delete(build_endpoint(DELETE_attribute, attribute: attribute_id))
        end
      end
    end
  end
end
