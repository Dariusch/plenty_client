module PlentyClient
  module Item
    class SalesPrice
      extend PlentyClient::Endpoint
      extend PlentyClient::Request


      LIST_ALL_SALES_PRICES = '/items/sales_prices'.freeze
      GET_SALES_PRICE       = '/items/sales_prices/{salesPriceId}'.freeze
      CREATE_SALES_PRICE    = '/items/sales_prices'.freeze
      UPDATE_SALES_PRICE    = '/items/sales_prices/{salesPriceId}'.freeze
      DELETE_SALES_PRICE    = '/items/sales_prices/{salesPriceId}'.freeze

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

        def delete(sales_price_id)
          delete(build_endpoint(DELETE_SALES_PRICE, sales_price: sales_price_id))
        end
      end
    end
  end
end