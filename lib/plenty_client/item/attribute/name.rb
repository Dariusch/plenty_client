# frozen_string_literal: true

module PlentyClient
  module Item
    module Attribute
      class Name
        include PlentyClient::Endpoint
        include PlentyClient::Request

        ITEM_ATTRIBUTE_PATH = '/items/attributes'

        CREATE_ITEM_ATTRIBUTES  = '/{attributeId}/names'
        LIST_ITEM_ATTRIBUTE     = '/{attributeId}/names'
        GET_ITEMS_ATTRIBUTE     = '/{attributeId}/names/{lang}'
        UPDATE_ITEMS_ATTRIBUTE  = '/{attributeId}/names/{lang}'
        DELETE_ITEMS_ATTRIBUTE  = '/{attributeId}/names/{lang}'

        class << self
          def create(attribute_id, headers = {})
            post(build_endpoint("#{ITEM_ATTRIBUTE_PATH}#{CREATE_ITEM_ATTRIBUTES}", attribute: attribute_id), headers)
          end

          def list(attribute_id, headers = {}, &block)
            get(build_endpoint("#{ITEM_ATTRIBUTE_PATH}#{LIST_ITEM_ATTRIBUTE}", attribute: attribute_id),
                headers, &block)
          end

          def find(attribute_id, lang, headers = {}, &block)
            get(build_endpoint("#{ITEM_ATTRIBUTE_PATH}#{GET_ITEMS_ATTRIBUTE}", attribute: attribute_id, lang: lang),
                headers, &block)
          end

          def update(attribute_id, lang, body = {})
            put(build_endpoint("#{ITEM_ATTRIBUTE_PATH}#{UPDATE_ITEMS_ATTRIBUTE}", attribute: attribute_id, lang: lang),
                body)
          end

          def destroy(attribute_id, lang)
            delete(build_endpoint("#{ITEM_ATTRIBUTE_PATH}#{DELETE_ITEMS_ATTRIBUTE}",
                                  attribute: attribute_id, lang: lang))
          end
        end
      end
    end
  end
end
