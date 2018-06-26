# frozen_string_literal: true

module PlentyClient
  module Listing
    module Market
      class History
        include PlentyClient::Endpoint
        include PlentyClient::Request

        FIND_LISTING_MARKET_HISTORY     = '/listings/markets/histories/{marketListingHistoryId}'
        LIST_LISTING_MARKET_HISTORIES   = '/listings/markets/histories'
        END_LISTING_MARKET_HISTORY      = '/listings/markets/histories/end/{marketListingHistoryId}'
        RELIST_LISTING_MARKET_HISTORY   = '/listings/markets/histories/relist/{marketListingHistoryId}'
        UPDATE_LISTING_MARKET_HISTORY   = '/listings/markets/histories/update/{marketListingHistoryId}'
        UPDATE_LISTING_MARKET_HISTORIES = '/listings/markets/histories/update'

        class << self
          def find(market_listing_history_id, headers = {}, &block)
            get(build_endpoint(FIND_LISTING_MARKET_HISTORY, market_listing_history: market_listing_history_id),
                headers, &block)
          end

          def list(headers = {}, &block)
            get(build_endpoint(LIST_LISTING_MARKET_HISTORIES), headers, &block)
          end

          def end(market_listing_history_id, body = {})
            delete(build_endpoint(END_LISTING_MARKET_HISTORY, market_listing_history: market_listing_history_id), body)
          end

          def relist(market_listing_history_id, body = {})
            post(build_endpoint(RELIST_LISTING_MARKET_HISTORY, market_listing_history: market_listing_history_id), body)
          end

          def update(market_listing_history_id, body = {})
            put(build_endpoint(UPDATE_LISTING_MARKET_HISTORY, market_listing_history: market_listing_history_id), body)
          end

          def update_many(body = {})
            put(build_endpoint(UPDATE_LISTING_MARKET_HISTORIES), body)
          end
        end
      end
    end
  end
end
