# frozen_string_literal: true

module PlentyClient
  module Market
    module Ebay
      class PartsFitment
        include PlentyClient::Endpoint
        include PlentyClient::Request

        LIST_MARKET_EBAY_PARTS_FITMENTS   = '/markets/ebay/parts-fitments'
        FIND_MARKET_EBAY_PARTS_FITMENT    = '/markets/ebay/parts-fitments/{fitmentId}'
        CREATE_MARKET_EBAY_PARTS_FITMENT  = '/markets/ebay/parts-fitments'
        UPDATE_MARKET_EBAY_PARTS_FITMENT  = '/markets/ebay/parts-fitments/{fitmentId}'
        DELETE_MARKET_EBAY_PARTS_FITMENT  = '/markets/ebay/parts-fitments/{fitmentId}'
        SEARCH_MARKET_EBAY_PARTS_FITMENTS = '/markets/ebay/parts-fitments/search'

        class << self
          def list(headers = {}, &block)
            get(build_endpoint(LIST_MARKET_EBAY_PARTS_FITMENTS), headers, &block)
          end

          def search(headers = {}, &block)
            get(build_endpoint(SEARCH_MARKET_EBAY_PARTS_FITMENTS), headers, &block)
          end

          def find(fitment_id, headers = {}, &block)
            get(build_endpoint(FIND_MARKET_EBAY_PARTS_FITMENT, fitment: fitment_id), headers, &block)
          end

          def create(body = {})
            post(build_endpoint(CREATE_MARKET_EBAY_PARTS_FITMENT), body)
          end

          def update(fitment_id, body = {})
            put(build_endpoint(UPDATE_MARKET_EBAY_PARTS_FITMENT, fitment: fitment_id), body)
          end

          def destroy(fitment_id, body = {})
            delete(build_endpoint(DELETE_MARKET_EBAY_PARTS_FITMENT, fitment: fitment_id), body)
          end
        end
      end
    end
  end
end
