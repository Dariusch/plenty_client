# frozen_string_literal: true

module PlentyClient
  module Listing
    module Market
      include PlentyClient::Endpoint
      include PlentyClient::Request

      FIND_LISTING_MARKET   = '/listings/markets/{marketListingId}'
      LIST_LISTING_MARKETS  = '/listings/markets'
      CREATE_LISTING_MARKET = '/listings/markets'
      UPDATE_LISTING_MARKET = '/listings/markets/{marketListingId}'
      DELETE_LISTING_MARKET = '/listings/markets/{marketListingId}'
      START_LISTING_MARKET  = '/listings/markets/start/{marketListingId}'
      VERIFY_LISTING_MARKET = '/listings/markets/verify/{marketListingId}'

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
