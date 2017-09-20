module PlentyClient
  module Listing
    module Market
      class Info
        include PlentyClient::Endpoint
        include PlentyClient::Request

        LIST_LISTINGS_MARKET_INFO = '/rest/listings/markets/info'.freeze

        class << self
          def list(headers = {}, &block)
            get(build_endpoint(LIST_LISTINGS_MARKET_INFO), headers, &block)
          end
        end
      end
    end
  end
end
