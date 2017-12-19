# frozen_string_literal: true

module PlentyClient
  module Item
    class Unit
      include PlentyClient::Endpoint
      include PlentyClient::Request

      CREATE_ITEMS_UNITS = '/items/units'
      LIST_ITEM_UNITS    = '/items/units'
      GET_ITEMS_UNIT     = '/items/units'
      UPDATE_ITEM_UNIT   = '/items/units/{unitId}'
      DELETE_ITEMS_UNIT  = '/items/units/{unitId}'

      class << self
        def create(headers = {})
          post(build_endpoint(CREATE_ITEMS_UNITS), headers)
        end

        def list(headers = {}, &block)
          get(build_endpoint(LIST_ITEM_UNITS), headers, &block)
        end

        def find(unit_id, headers = {}, &block)
          get(build_endpoint(GET_ITEMS_UNIT, unit: unit_id), headers, &block)
        end

        def update(unit_id, headers = {}, &block)
          put(build_endpoint(UPDATE_ITEM_UNIT, unit: unit_id), headers, &block)
        end

        def destroy(unit_id)
          delete(build_endpoint(DELETE_ITEMS_UNIT, unit: unit_id))
        end
      end
    end
  end
end
