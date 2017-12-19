# frozen_string_literal: true

module PlentyClient
  module Item
    module Property
      class MarketReference
        include PlentyClient::Endpoint
        include PlentyClient::Request

        ITEM_PROPERTY_MARKET_REFERENCE_PATH     = '/items/properties'

        CREATE_ITEM_PROPERTY_MARKET_REFERENCE   = '/{propertyId}/market_references'
        LIST_ITEM_PROPERTY_MARKET_REFERENCE     = '/{propertyId}/market_references'
        GET_ITEMS_PROPERTY_MARKET_REFERENCE     = '/{propertyId}/market_references/{marketId}'
        UPDATE_ITEMS_PROPERTY_MARKET_REFERENCE  = '/{propertyId}/market_references/{marketId}'
        DELETE_ITEMS_PROPERTY_MARKET_REFERENCE  = '/{propertyId}/market_references/{marketId}'

        class << self
          def create(property_id, headers = {})
            post(build_endpoint("#{ITEM_PROPERTY_MARKET_REFERENCE_PATH}#{CREATE_ITEM_PROPERTY_MARKET_REFERENCE}",
                                property: property_id),
                 headers)
          end

          def list(property_id, headers = {}, &block)
            get(build_endpoint("#{ITEM_PROPERTY_MARKET_REFERENCE_PATH}#{LIST_ITEM_PROPERTY_MARKET_REFERENCE}",
                               property: property_id),
                headers, &block)
          end

          def find(property_id, market_id, headers = {}, &block)
            get(build_endpoint("#{ITEM_PROPERTY_MARKET_REFERENCE_PATH}#{GET_ITEMS_PROPERTY_MARKET_REFERENCE}",
                               property: property_id,
                               market: market_id),
                headers, &block)
          end

          def update(property_id, market_id, body = {})
            put(build_endpoint("#{ITEM_PROPERTY_MARKET_REFERENCE_PATH}#{UPDATE_ITEMS_PROPERTY_MARKET_REFERENCE}",
                               property: property_id,
                               market: market_id),
                body)
          end

          def destroy(property_id, market_id)
            delete(build_endpoint("#{ITEM_PROPERTY_MARKET_REFERENCE_PATH}#{DELETE_ITEMS_PROPERTY_MARKET_REFERENCE}",
                                  property: property_id,
                                  market: market_id))
          end
        end
      end
    end
  end
end
