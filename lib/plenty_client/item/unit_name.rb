module PlentyClient
  module Item
    class UnitName
      extend PlentyClient::Endpoint
      extend PlentyClient::Request

      ITEM_UNIT_PATH    = '/items/{itemId}/units'.freeze

      ITEM_UNITS         = '/names'.freeze
      LIST_ITEM_UNIT     = '/names'.freeze
      GET_ITEMS_UNIT     = '/names/{lang}'.freeze
      UPDATE_ITEMS_UNIT  = '/names/{lang}'.freeze
      DELETE_ITEMS_UNIT  = '/names/{lang}'.freeze

      class << self
        def create(item_id, headers = {})
          post(build_endpoint(CREATE_ITEMS_UNITS), headers)
        end

        def list(item_id, headers = {}, &block)
          get(build_endpoint(LIST_ITEM_UNIT), headers, &block)
        end

        def find(unit_id, lang, headers = {}, &block)
          get(build_endpoint(GET_ITEMS_UNIT, unit: unit_id, lang: lang), headers, &block)
        end

        def update(unit_id, lang, headers = {}, &block)
          put(build_endpoint(UPDATE_ITEMS_UNIT, unit: unit_id, lang: lang), headers, &block)
        end

        def delete(unit_id, lang)
          delete(build_endpoint(DELETE_ITEMS_UNIT, unit: unit_id, lang: lang))
        end
      end
    end
  end
end
