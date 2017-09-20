module PlentyClient
  module Listing
    class Market
      include PlentyClient::Endpoint
      include PlentyClient::Request

      FIND_LISTING_MARKET   = '/listings/markets/{marketListingId}'.freeze
      LIST_LISTING_MARKETS  = '/listings/markets'.freeze
      CREATE_LISTING_MARKET = '/listings/markets'.freeze
      UPDATE_LISTING_MARKET = '/listings/markets/{marketListingId}'.freeze
      DELETE_LISTING_MARKET = '/listings/markets/{marketListingId}'.freeze
      START_LISTING_MARKET  = '/listings/markets/start/{marketListingId}'.freeze
      VERIFY_LISTING_MARKET = '/listings/markets/verify/{marketListingId}'.freeze

      class << self
        def find(market_listing_id, headers = {}, &block)
          get(build_endpoint(FIND_LISTING_MARKET, market_listing: market_listing_id), headers, &block)
        end

        def list(headers = {}, &block)
          get(build_endpoint(LIST_LISTING_MARKETS), headers, &block)
        end

        def create(body = {})
          post(build_endpoint(CREATE_LISTING_MARKET), body)
        end

        def update(market_listing_id, body = {})
          put(build_endpoint(UPDATE_LISTING_MARKET, market_listing: market_listing_id), body)
        end

        def destroy(market_listing_id, body = {})
          delete(build_endpoint(DELETE_LISTING_MARKET, market_listing: market_listing_id), body)
        end

        def start(market_listing_id, body = {})
          post(build_endpoint(START_LISTING_MARKET, market_listing: market_listing_id), body)
        end

        def verify(market_listing_id, body = {})
          post(build_endpoint(VERIFY_LISTING_MARKET, market_listing: market_listing_id), body)
        end
      end
    end
  end
end
