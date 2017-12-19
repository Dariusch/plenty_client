# frozen_string_literal: true

module PlentyClient
  module Listing
    module Market
      class Text
        include PlentyClient::Endpoint
        include PlentyClient::Request

        FIND_LISTING_MARKET_TEXT   = '/listings/markets/texts/{marketTextId}'
        LIST_LISTING_MARKET_TEXTS  = '/listings/markets/texts'
        CREATE_LISTING_MARKET_TEXT = '/listings/markets/texts'
        UPDATE_LISTING_MARKET_TEXT = '/listings/markets/texts/{marketTextId}'
        DELETE_LISTING_MARKET_TEXT = '/listings/markets/texts/{marketTextId}'

        class << self
          def find(market_text_id, headers = {}, &block)
            get(build_endpoint(FIND_LISTING_MARKET_TEXT, market_text: market_text_id), headers, &block)
          end

          def list(headers = {}, &block)
            get(build_endpoint(LIST_LISTING_MARKET_TEXTS), headers, &block)
          end

          def create(body = {})
            post(build_endpoint(CREATE_LISTING_MARKET_TEXT), body)
          end

          def update(market_text_id, body = {})
            put(build_endpoint(UPDATE_LISTING_MARKET_TEXT, market_text: market_text_id), body)
          end

          def destroy(market_text_id, body = {})
            delete(build_endpoint(DELETE_LISTING_MARKET_TEXT, market_text: market_text_id), body)
          end
        end
      end
    end
  end
end
