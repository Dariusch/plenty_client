# frozen_string_literal: true

module PlentyClient
  module SalesPrice
    class OnlineStore
      include PlentyClient::Endpoint
      include PlentyClient::Request

      LIST_SALES_PRICE_ONLINE_STORES      = '/items/sales_prices/{salesPriceId}/online_stores'
      ACTIVATE_SALES_PRICE_ONLINE_STORE   = '/items/sales_prices/{salesPriceId}/online_stores'
      DEACTIVATE_SALES_PRICE_ONLINE_STORE = '/items/sales_prices/{salesPriceId}/online_stores/{webstoreId}'

      class << self
        def list(sales_price_id, headers = {}, &block)
          get(build_endpoint(LIST_SALES_PRICE_ONLINE_STORES, sales_price: sales_price_id), headers, &block)
        end

        def activate(sales_price_id, headers = {})
          post(build_endpoint(ACTIVATE_SALES_PRICE_ONLINE_STORE, sales_price: sales_price_id), headers)
        end

        def deactivate(sales_price_id, webstore_id)
          delete(build_endpoint(DEACTIVATE_SALES_PRICE_ONLINE_STORE,
                                sales_price: sales_price_id,
                                webstore: webstore_id))
        end
      end
    end
  end
end
