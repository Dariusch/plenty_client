# frozen_string_literal: true

module PlentyClient
  module Item
    module Attribute
      class ValueName
        include PlentyClient::Endpoint
        include PlentyClient::Request

        ITEM_ATTRIBUTE_PATH = '/items/attribute_values'

        CREATE_ITEM_ATTRIBUTE_VALUES  = '/{attributeValueId}/names'
        LIST_ITEM_ATTRIBUTE_VALUE     = '/{attributeValueId}/names'
        GET_ITEMS_ATTRIBUTE_VALUE     = '/{attributeValueId}/names/{lang}'
        UPDATE_ITEMS_ATTRIBUTE_VALUE  = '/{attributeValueId}/names/{lang}'
        DELETE_ITEMS_ATTRIBUTE_VALUE  = '/{attributeValueId}/names/{lang}'

        class << self
          def create(attribute_value_id, body = {})
            post(build_endpoint("#{ITEM_ATTRIBUTE_PATH}#{CREATE_ITEM_ATTRIBUTE_VALUES}",
                                attribute_value: attribute_value_id),
                 body)
          end

          def list(attribute_value_id, headers = {}, &block)
            get(build_endpoint("#{ITEM_ATTRIBUTE_PATH}#{LIST_ITEM_ATTRIBUTE_VALUE}",
                               attribute_value: attribute_value_id),
                headers, &block)
          end

          def find(attribute_value_id, lang, headers = {}, &block)
            get(build_endpoint("#{ITEM_ATTRIBUTE_PATH}#{GET_ITEMS_ATTRIBUTE_VALUE}",
                               attribute_value: attribute_value_id,
                               lang: lang),
                headers, &block)
          end

          def update(attribute_value_id, lang, body = {}, &block)
            put(build_endpoint("#{ITEM_ATTRIBUTE_PATH}#{UPDATE_ITEMS_ATTRIBUTE_VALUE}",
                               attribute_value: attribute_value_id,
                               lang: lang),
                body, &block)
          end

          def destroy(attribute_value_id, _value_id)
            delete(build_endpoint("#{ITEM_ATTRIBUTE_PATH}#{DELETE_ITEMS_ATTRIBUTE_VALUE}",
                                  attribute_value: attribute_value_id,
                                  lang: lang))
          end
        end
      end
    end
  end
end
