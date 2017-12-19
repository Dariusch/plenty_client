# frozen_string_literal: true

# frozen_string_literal: true

module PlentyClient
  module Item
    class UnitName
      include PlentyClient::Endpoint
      include PlentyClient::Request

      LIST_ITEM_UNIT_NAMES    = '/item/units/{unitID}/names'
      FIND_ITEM_UNIT_NAME     = '/item/units/{unitID}/names/{lang}'
      CREATE_ITEMS_UNIT_NAME  = '/item/units/{unitID}/names'
      UPDATE_ITEMS_UNIT_NAME  = '/item/units/{unitID}/names/{lang}'
      DELETE_ITEMS_UNIT_NAME  = '/item/units/{unitID}/names/{lang}'

      class << self
        def list(unit_id, headers = {}, &block)
          get(build_endpoint(LIST_ITEM_UNIT_NAMES, unit: unit_id), headers, &block)
        end

        def find(unit_id, lang, headers = {}, &block)
          get(build_endpoint(FIND_ITEM_UNIT_NAME, unit: unit_id, lang: lang), headers, &block)
        end

        def create(unit_id, headers = {})
          post(build_endpoint(CREATE_ITEMS_UNIT_NAME, unit: unit_id), headers)
        end

        def update(unit_id, lang, headers = {}, &block)
          put(build_endpoint(UPDATE_ITEMS_UNIT_NAME, unit: unit_id, lang: lang), headers, &block)
        end

        def destroy(unit_id, lang)
          delete(build_endpoint(DELETE_ITEMS_UNIT_NAME, unit: unit_id, lang: lang))
        end
      end
    end
  end
end
