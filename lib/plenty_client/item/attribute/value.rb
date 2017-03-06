module PlentyClient
  module Item
    module Attribute
      class Value
        extend PlentyClient::Endpoint
        extend PlentyClient::Request

        ITEM_ATTRIBUTE_PATH    = '/items/attributes'.freeze

        CREATE_ITEM_ATTRIBUTE_VALUES  = '/{attributeId}/values'.freeze
        LIST_ITEM_ATTRIBUTE_VALUE     = '/{attributeId}/values'.freeze
        GET_ITEMS_ATTRIBUTE_VALUE     = '/{attributeId}/values/{valueId}'.freeze
        UPDATE_ITEMS_ATTRIBUTE_VALUE  = '/{attributeId}/values/{valueId}'.freeze
        DELETE_ITEMS_ATTRIBUTE_VALUE  = '/{attributeId}/values/{valueId}'.freeze

        class << self
          def create(attribute_id, body = {})
            post(build_endpoint("#{ITEM_ATTRIBUTE_PATH}#{CREATE_ITEM_ATTRIBUTE_VALUES}"),
                                attribute: attribute_id,
                                body)
          end

          def list(attribute_id, headers = {}, &block)
            get(build_endpoint("#{ITEM_ATTRIBUTE_PATH}#{LIST_ITEM_ATTRIBUTE_VALUE}"),
                                attribute: attribute_id,
                                headers, &block)
          end

          def find(attribute_id, value_id, headers = {}, &block)
            get(build_endpoint("#{ITEM_ATTRIBUTE_PATH}#{GET_ITEMS_ATTRIBUTE_VALUE}",
                               attribute: attribute_id,
                               value: value_id),
                               headers, &block)
          end

          def update(attribute_id, value_id, body = {}, &block)
            put(build_endpoint("#{ITEM_ATTRIBUTE_PATH}#{UPDATE_ITEMS_ATTRIBUTE_VALUE}",
                               attribute: attribute_id,
                               value: value_id),
                               body, &block)
          end

          def delete(attribute_id, value_id)
            delete(build_endpoint("#{ITEM_ATTRIBUTE_PATH}#{DELETE_ITEMS_ATTRIBUTE_VALUE}",
                                  attribute: attribute_id,
                                  value: value_id))
          end
        end
      end
    end
  end
end