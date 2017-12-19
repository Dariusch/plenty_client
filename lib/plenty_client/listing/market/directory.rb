# frozen_string_literal: true

module PlentyClient
  module Listing
    module Market
      class Directory
        include PlentyClient::Endpoint
        include PlentyClient::Request

        FIND_LISTING_MARKET   = '/listings/markets/directories/{directoryId}'
        CREATE_LISTING_MARKET = '/listings/markets/directories'
        UPDATE_LISTING_MARKET = '/listings/markets/directories/{directoryId}'
        DELETE_LISTING_MARKET = '/listings/markets/directories/{directoryId}'

        class << self
          def find(directory_id, headers = {}, &block)
            get(build_endpoint(FIND_LISTING_MARKET, directory: directory_id), headers, &block)
          end

          def create(body = {})
            post(build_endpoint(CREATE_LISTING_MARKET), body)
          end

          def update(directory_id, body = {})
            put(build_endpoint(UPDATE_LISTING_MARKET, directory: directory_id), body)
          end

          def destroy(directory_id, body = {})
            delete(build_endpoint(DELETE_LISTING_MARKET, directory: directory_id), body)
          end
        end
      end
    end
  end
end
