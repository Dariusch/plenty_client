# frozen_string_literal: true

module PlentyClient
  module Item
    module Variation
      class MarketIdentNumber
        include PlentyClient::Endpoint
        include PlentyClient::Request

        ITEM_VARIATION_MARKET_IDENT_PATH    = '/items/{itemId}/variations/{variationId}'

        LIST_ITEM_VARIATION_MARKET_IDENT    = '/market_ident_numbers'
        GET_ITEM_VARIATIONS_MARKET_IDENT    = '/market_ident_numbers/{marketIdentNumberId}'
        CREATE_ITEM_VARIATIONS_MARKET_IDENT = '/market_ident_numbers'
        UPDATE_ITEM_VARIATIONS_MARKET_IDENT = '/market_ident_numbers/{marketIdentNumberId}'
        DELETE_ITEM_VARIATIONS_MARKET_IDENT = '/market_ident_numbers/{marketIdentNumberId}'

        class << self
          def list(item_id, variation_id, headers = {}, &block)
            get(build_endpoint("#{ITEM_VARIATION_MARKET_IDENT_PATH}#{LIST_ITEM_VARIATION_MARKET_IDENT}",
                               item: item_id,
                               variation: variation_id), headers, &block)
          end

          def find(item_id, variation_id, market_ident_number_id, headers = {})
            get(build_endpoint("#{ITEM_VARIATION_MARKET_IDENT_PATH}#{GET_ITEM_VARIATIONS_MARKET_IDENT}",
                               item: item_id,
                               variation: variation_id,
                               market_ident_number: market_ident_number_id), headers, &block)
          end

          def create(item_id, variation_id, body = {})
            post(build_endpoint("#{ITEM_VARIATION_MARKET_IDENT_PATH}#{CREATE_ITEM_VARIATIONS_MARKET_IDENT}",
                                item: item_id,
                                variation: variation_id), body)
          end

          def update(item_id, variation_id, market_ident_number_id, body = {})
            put(build_endpoint("#{ITEM_VARIATION_MARKET_IDENT_PATH}#{UPDATE_ITEM_VARIATIONS_MARKET_IDENT}",
                               item: item_id,
                               variation: variation_id,
                               market_ident_number: market_ident_number_id), body)
          end

          def destroy(item_id, variation_id, market_ident_number_id)
            delete(build_endpoint("#{ITEM_VARIATION_MARKET_IDENT_PATH}#{DELETE_ITEM_VARIATIONS_MARKET_IDENT}",
                                  item: item_id,
                                  variation: variation_id,
                                  market_ident_number: market_ident_number_id))
          end
        end
      end
    end
  end
end
