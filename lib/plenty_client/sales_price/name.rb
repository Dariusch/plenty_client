# frozen_string_literal: true

module PlentyClient
  module SalesPrice
    class Name
      include PlentyClient::Endpoint
      include PlentyClient::Request

      LIST_SALES_PRICE_NAMES        = '/items/sales_prices/{salesPriceId}/names'
      GET_SALES_PRICE_NAMES_BY_LANG = '/items/sales_prices/{salesPriceId}/names/{lang}'
      CREATE_SALES_PRICE_NAME       = '/items/sales_prices/{salesPriceId}/names'
      UPDATE_SALES_PRICE_NAME       = '/items/sales_prices/{salesPriceId}/names/{lang}'
      DELETE_SALES_PRICE_NAME       = '/items/sales_prices/{salesPriceId}/names/{lang}'

      class << self
        def list(sales_price_id, headers = {}, &block)
          get(build_endpoint(LIST_SALES_PRICE_NAMES, sales_price: sales_price_id), headers, &block)
        end

        def list_by_lang(sales_price_id, lang, headers = {}, &block)
          get(build_endpoint(GET_SALES_PRICE_NAMES_BY_LANG, sales_price: sales_price_id, lang: lang), headers, &block)
        end

        def create(sales_price_id, headers = {})
          post(build_endpoint(CREATE_SALES_PRICE_NAME, sales_price: sales_price_id), headers)
        end

        def update(sales_price_id, lang, headers = {})
          post(build_endpoint(UPDATE_SALES_PRICE_NAME, sales_price: sales_price_id, lang: lang), headers)
        end

        def destroy(sales_price_id, lang)
          delete(build_endpoint(DELETE_SALES_PRICE_NAME, sales_price: sales_price_id, lang: lang))
        end
      end
    end
  end
end
