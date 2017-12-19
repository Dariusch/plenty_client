# frozen_string_literal: true

module PlentyClient
  module Item
    class SalesPrice
      include PlentyClient::Endpoint
      include PlentyClient::Request

      LIST_ALL_SALES_PRICES = '/items/sales_prices'
      GET_SALES_PRICE       = '/items/sales_prices/{salesPriceId}'
      CREATE_SALES_PRICE    = '/items/sales_prices'
      UPDATE_SALES_PRICE    = '/items/sales_prices/{salesPriceId}'
      DELETE_SALES_PRICE    = '/items/sales_prices/{salesPriceId}'

      class << self
        def list(headers = {}, &block)
          get(build_endpoint(LIST_ALL_SALES_PRICES), headers, &block)
        end

        def find(sales_price_id, headers = {}, &block)
          get(build_endpoint(GET_SALES_PRICE, sales_price: sales_price_id), headers, &block)
        end

        def create(headers = {})
          post(build_endpoint(CREATE_SALES_PRICE), headers)
        end

        def update(sales_price_id, headers = {})
          put(build_endpoint(UPDATE_SALES_PRICE, sales_price: sales_price_id), headers)
        end

        def destroy(sales_price_id)
          delete(build_endpoint(DELETE_SALES_PRICE, sales_price: sales_price_id))
        end
      end
    end
  end
end
