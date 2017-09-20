module PlentyClient
  module Listing
    include PlentyClient::Endpoint
    include PlentyClient::Request

    FIND_LISTING           = '/listings/{listingId}'.freeze
    LIST_LISTINGS          = '/listings'.freeze
    CREATE_LISTING         = '/listings'.freeze
    UPDATE_LISTING         = '/listings/{listingId}'.freeze
    DELETE_LISTING         = '/listings/{listingId}'.freeze

    class << self
      def list(headers = {}, &block)
        get(build_endpoint(LIST_LISTINGS), headers, &block)
      end

      def find(listing_id = nil, headers = {}, &block)
        get(build_endpoint(FIND_LISTING, listing: listing_id), headers, &block)
      end

      def create(body = {})
        post(CREATE_LISTING, body)
      end

      def update(listing_id, body = {})
        post(build_endpoint(UPDATE_LISTING, listing: listing_id), body)
      end

      def destroy(listing_id, body = {})
        delete(build_endpoint(DELETE_LISTING, listing: listing_id), body)
      end
    end
  end
end
