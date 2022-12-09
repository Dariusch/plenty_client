# frozen_string_literal: true

# PlentyClient::Listing::Market::Info.list
module PlentyClient
  module Listing
    module Market
      class Info
        include PlentyClient::Endpoint
        include PlentyClient::Request

        # https://developers.plentymarkets.com/en-gb/plentymarkets-rest-api/index.html#/Listing/get_rest_listings_markets_infos
        LIST_LISTINGS_MARKET_INFO = '/listings/markets/infos'

        class << self
          def list(headers = {}, &block)
            get(build_endpoint(LIST_LISTINGS_MARKET_INFO), headers, &block)
          end
        end
      end
    end
  end
end
