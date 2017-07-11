module PlentyClient
  module Item
    class Unit
      include PlentyClient::Endpoint
      include PlentyClient::Request

      CREATE_ITEMS_UNITS = '/items/{itemId}/units'.freeze
      GET_ITEMS_UNIT     = '/items/{itemId}/units'.freeze
      DELETE_ITEMS_UNIT  = '/items/{itemId}/units/{unitId}'.freeze

      class << self
        def create(headers = {})
          post(build_endpoint(CREATE_ITEMS_UNITS), headers)
        end

        def list(headers = {}, &block)
          get(build_endpoint(GET_ITEMS_UNIT), headers, &block)
        end

        def find(unit_id, headers = {}, &block)
          get(build_endpoint(GET_ITEMS_UNIT, unit: unit_id), headers, &block)
        end

        def update(unit_id, headers = {}, &block)
          put(build_endpoint(GET_ITEMS_UNIT, unit: unit_id), headers, &block)
        end

        def destroy(unit_id)
          delete(build_endpoint(DELETE_ITEMS_UNIT, unit: unit_id))
        end
      end
    end
  end
end
