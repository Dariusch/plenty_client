# frozen_string_literal: true

module PlentyClient
  module Listing
    class Type
      include PlentyClient::Endpoint
      include PlentyClient::Request

      FIND_LISTINGS_TYPE   = '/listings/types/{typeId}'
      LIST_LISTINGS_TYPES  = '/listings/types'

      class << self
        def find(type_id, headers = {}, &block)
          get(build_endpoint(FIND_LISTINGS_TYPE, type: type_id), headers, &block)
        end

        def list(headers = {}, &block)
          get(build_endpoint(LIST_LISTINGS_TYPES), headers, &block)
        end
      end
    end
  end
end
