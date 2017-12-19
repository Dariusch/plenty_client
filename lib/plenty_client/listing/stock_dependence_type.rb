# frozen_string_literal: true

module PlentyClient
  module Listing
    class StockDependenceType
      include PlentyClient::Endpoint
      include PlentyClient::Request

      FIND_LISTINGS_STOCK_DEPENCENCE_TYPE   = '/listings/types/{typeId}'
      LIST_LISTINGS_STOCK_DEPENCENCE_TYPES  = '/listings/types'

      class << self
        def find(type_id, headers = {}, &block)
          GET(BUILD_ENDPOINT(FIND_LISTINGS_STOCK_DEPENCENCE_TYPE, type: type_id), headers, &block)
        end

        def list(headers = {}, &block)
          GET(BUILD_ENDPOINT(LIST_LISTINGS_STOCK_DEPENCENCE_TYPES), headers, &block)
        end
      end
    end
  end
end
