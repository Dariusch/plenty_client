# TODO: Fix class, PlentyMarkets changed syntax
module PlentyClient
  module Item
    class UnitName
      include PlentyClient::Endpoint
      include PlentyClient::Request

      ITEM_UNIT_PATH     = '/items/{itemId}/units'.freeze

      ITEM_UNITS         = '/names'.freeze
      LIST_ITEM_UNIT     = '/names'.freeze
      GET_ITEMS_UNIT     = '/names/{lang}'.freeze
      UPDATE_ITEMS_UNIT  = '/names/{lang}'.freeze
      DELETE_ITEMS_UNIT  = '/names/{lang}'.freeze

      class << self
        def create(item_id, headers = {})
          post(build_endpoint(CREATE_ITEMS_UNITS, item: item_id), headers)
        end

        def list(item_id, headers = {}, &block)
          get(build_endpoint(LIST_ITEM_UNIT, item: item_id), headers, &block)
        end

        def find(item_id, unit_id, lang, headers = {}, &block)
          get(build_endpoint(GET_ITEMS_UNIT, item: item_id, unit: unit_id, lang: lang), headers, &block)
        end

        def update(item_id, unit_id, lang, headers = {}, &block)
          put(build_endpoint(UPDATE_ITEMS_UNIT, item: item_id, unit: unit_id, lang: lang), headers, &block)
        end

        def destroy(item_id, unit_id, lang)
          delete(build_endpoint(DELETE_ITEMS_UNIT, item: item_id, unit: unit_id, lang: lang))
        end
      end
    end
  end
end
