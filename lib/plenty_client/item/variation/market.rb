# frozen_string_literal: true

module PlentyClient
  module Item
    module Variation
      class Market
        include PlentyClient::Endpoint
        include PlentyClient::Request

        ITEM_VARIATION_MARKETS_PATH    = '/items/{itemId}/variations/{variationId}'

        GET_ITEM_VARIATIONS_MARKETS    = '/variation_markets'
        CREATE_ITEM_VARIATIONS_MARKETS = '/variation_markets'
        DELETE_ITEM_VARIATIONS_MARKETS = '/variation_markets/{marketplaceId}'

        class << self
          def list(item_id, variation_id, headers = {}, &block)
            get(build_endpoint("#{ITEM_VARIATION_MARKETS_PATH}#{GET_ITEM_VARIATIONS_MARKETS}",
                               item: item_id,
                               variation: variation_id), headers, &block)
          end

          def create(item_id, variation_id, body = {})
            post(build_endpoint("#{ITEM_VARIATION_MARKETS_PATH}#{CREATE_ITEM_VARIATIONS_MARKETS}",
                                item: item_id,
                                variation: variation_id), body)
          end

          def destroy(item_id, variation_id, marketplace_id)
            delete(build_endpoint("#{ITEM_VARIATION_MARKETS_PATH}#{DELETE_ITEM_VARIATIONS_MARKETS}",
                                  item: item_id,
                                  variation: variation_id,
                                  marketplace: marketplace_id))
          end
        end
      end
    end
  end
end
