module PlentyClient
  module Item
    module Variation
      class MarketIdentNumber
        include PlentyClient::Endpoint
        include PlentyClient::Request

        ITEM_VARIATION_MARKET_IDENT_PATH    = '/items/{itemId}/variations/{variationId}'.freeze

        LIST_ITEM_VARIATION_MARKET_IDENT    = '/market_ident_numbers'.freeze
        GET_ITEM_VARIATIONS_MARKET_IDENT    = '/market_ident_numbers/{marketIdentNumberId}'.freeze
        CREATE_ITEM_VARIATIONS_MARKET_IDENT = '/market_ident_numbers'.freeze
        UPDATE_ITEM_VARIATIONS_MARKET_IDENT = '/market_ident_numbers/{marketIdentNumberId}'.freeze
        DELETE_ITEM_VARIATIONS_MARKET_IDENT = '/market_ident_numbers/{marketIdentNumberId}'.freeze

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
