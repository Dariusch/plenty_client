# frozen_string_literal: true

module PlentyClient
  module SalesPrice
    class Referrer
      include PlentyClient::Endpoint
      include PlentyClient::Request

      LIST_SALES_PRICE_REFERRER       = '/items/sales_prices/{salesPriceId}/referrers'
      ACTIVATE_SALES_PRICE_REFERRER   = '/items/sales_prices/{salesPriceId}/referrers'
      DEACTIVATE_SALES_PRICE_REFERRER = '/items/sales_prices/{salesPriceId}/referrers/{referrerId}'

      class << self
        def list(sales_price_id, headers = {}, &block)
          get(build_endpoint(LIST_SALES_PRICE_REFERRER, sales_price: sales_price_id), headers, &block)
        end

        def activate(sales_price_id, headers = {})
          post(build_endpoint(ACTIVATE_SALES_PRICE_REFERRER, sales_price: sales_price_id), headers)
        end

        def deactivate(sales_price_id, country_id)
          delete(build_endpoint(DEACTIVATE_SALES_PRICE_REFERRER, sales_price: sales_price_id, country: country_id))
        end
      end
    end
  end
end
