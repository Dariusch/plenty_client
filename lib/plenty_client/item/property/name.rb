# frozen_string_literal: true

module PlentyClient
  module Item
    module Property
      class Name
        include PlentyClient::Endpoint
        include PlentyClient::Request

        ITEM_PROPERTY_PATH      = '/items/properties'

        CREATE_ITEM_PROPERTIES  = '/{propertyId}/names'
        LIST_ITEM_PROPERTY      = '/{propertyId}/names'
        GET_ITEMS_PROPERTY      = '/{propertyId}/names/{lang}'
        UPDATE_ITEMS_PROPERTY   = '/{propertyId}/names/{lang}'
        DELETE_ITEMS_PROPERTY   = '/{propertyId}/names/{lang}'

        class << self
          def create(property_id, headers = {})
            post(build_endpoint("#{ITEM_PROPERTY_PATH}#{CREATE_ITEM_PROPERTIES}", property: property_id),
                 headers)
          end

          def list(property_id, headers = {}, &block)
            get(build_endpoint("#{ITEM_PROPERTY_PATH}#{LIST_ITEM_PROPERTY}", property: property_id),
                headers, &block)
          end

          def find(property_id, lang, headers = {}, &block)
            get(build_endpoint("#{ITEM_PROPERTY_PATH}#{GET_ITEMS_PROPERTY}",
                               property: property_id, lang: lang),
                headers, &block)
          end

          def update(property_id, lang, body = {})
            put(build_endpoint("#{ITEM_PROPERTY_PATH}#{UPDATE_ITEMS_PROPERTY}",
                               property: property_id, lang: lang),
                body)
          end

          def destroy(property_id, lang)
            delete(build_endpoint("#{ITEM_PROPERTY_PATH}#{DELETE_ITEMS_PROPERTY}",
                                  property: property_id, lang: lang))
          end
        end
      end
    end
  end
end
