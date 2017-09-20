module PlentyClient
  module Listing
    module Market
      class Directory
        include PlentyClient::Endpoint
        include PlentyClient::Request

        FIND_LISTING_MARKET   = '/listings/markets/directories/{directoryId}'.freeze
        CREATE_LISTING_MARKET = '/listings/markets/directories'.freeze
        UPDATE_LISTING_MARKET = '/listings/markets/directories/{directoryId}'.freeze
        DELETE_LISTING_MARKET = '/listings/markets/directories/{directoryId}'.freeze

        class << self
          def find(market_listing_id, headers = {}, &block)
            get(build_endpoint(FIND_LISTING_MARKET, market_listing: market_listing_id), headers, &block)
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
        end
      end
    end
  end
end
