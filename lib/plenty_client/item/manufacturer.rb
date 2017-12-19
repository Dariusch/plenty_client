# frozen_string_literal: true

module PlentyClient
  module Item
    module Manufacturer
      include PlentyClient::Endpoint
      include PlentyClient::Request

      LIST_ALL_MANUFACTURERS  = '/items/manufacturers'
      GET_MANUFACTURER        = '/items/manufacturers/{manufacturerId}'
      CREATE_MANUFACTURER     = '/items/manufacturers'
      UPDATE_MANUFACTURER     = '/items/manufacturers/{manufacturerId}'
      DELETE_MANUFACTURER     = '/items/manufacturers/{manufacturerId}'

      class << self
        def list(headers = {}, &block)
          get(build_endpoint(LIST_ALL_MANUFACTURERS), headers, &block)
        end

        def find(manufacturer_id, headers = {}, &block)
          get(build_endpoint(GET_MANUFACTURER, manufacturer: manufacturer_id), headers, &block)
        end

        def create(headers = {})
          post(build_endpoint(CREATE_MANUFACTURER), headers)
        end

        def update(manufacturer_id, headers = {})
          put(build_endpoint(UPDATE_MANUFACTURER, manufacturer: manufacturer_id), headers)
        end

        def destroy(manufacturer_id)
          delete(build_endpoint(DELETE_MANUFACTURER, manufacturer: manufacturer_id))
        end
      end
    end
  end
end
