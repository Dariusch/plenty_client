# frozen_string_literal: true

module PlentyClient
  module Item
    module Attribute
      class Value
        include PlentyClient::Endpoint
        include PlentyClient::Request

        ITEM_ATTRIBUTE_PATH = '/items/attributes'

        CREATE_ITEM_ATTRIBUTE_VALUES  = '/{attributeId}/values'
        LIST_ITEM_ATTRIBUTE_VALUE     = '/{attributeId}/values'
        GET_ITEMS_ATTRIBUTE_VALUE     = '/{attributeId}/values/{valueId}'
        UPDATE_ITEMS_ATTRIBUTE_VALUE  = '/{attributeId}/values/{valueId}'
        DELETE_ITEMS_ATTRIBUTE_VALUE  = '/{attributeId}/values/{valueId}'

        class << self
          def create(attribute_id, body = {})
            post(build_endpoint("#{ITEM_ATTRIBUTE_PATH}#{CREATE_ITEM_ATTRIBUTE_VALUES}", attribute: attribute_id),
                 body)
          end

          def list(attribute_id, headers = {}, &block)
            get(build_endpoint("#{ITEM_ATTRIBUTE_PATH}#{LIST_ITEM_ATTRIBUTE_VALUE}", attribute: attribute_id),
                headers, &block)
          end

          def find(attribute_id, value_id, headers = {}, &block)
            get(build_endpoint("#{ITEM_ATTRIBUTE_PATH}#{GET_ITEMS_ATTRIBUTE_VALUE}",
                               attribute: attribute_id, value: value_id),
                headers, &block)
          end

          def update(attribute_id, value_id, body = {}, &block)
            put(build_endpoint("#{ITEM_ATTRIBUTE_PATH}#{UPDATE_ITEMS_ATTRIBUTE_VALUE}",
                               attribute: attribute_id, value: value_id),
                body, &block)
          end

          def destroy(attribute_id, value_id)
            delete(build_endpoint("#{ITEM_ATTRIBUTE_PATH}#{DELETE_ITEMS_ATTRIBUTE_VALUE}",
                                  attribute: attribute_id, value: value_id))
          end
        end
      end
    end
  end
end
