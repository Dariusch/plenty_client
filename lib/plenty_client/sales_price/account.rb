module PlentyClient
  module SalesPrice
    class Account
      include PlentyClient::Endpoint
      include PlentyClient::Request

      LIST_REFERRER_ACCOUNTS      = '/items/sales_prices/{salesPriceId}/accounts'.freeze
      ACTIVATE_REFERRER_ACCOUNT   = '/items/sales_prices/{salesPriceId}/accounts'.freeze
      DEACTIVATE_REFERRER_ACCOUNT = '/items/sales_prices/{salesPriceId}/accounts/{accountType}/{accountId}'.freeze

      class << self
        def list(sales_price_id, headers = {}, &block)
          get(build_endpoint(LIST_REFERRER_ACCOUNTS, sales_price: sales_price_id), headers, &block)
        end

        def activate(sales_price_id, headers = {})
          post(build_endpoint(ACTIVATE_REFERRER_ACCOUNT, sales_price: sales_price_id), headers)
        end

        def deactivate(sales_price_id, account_type_id, account_id)
          delete(build_endpoint(DEACTIVATE_REFERRER_ACCOUNT,
                                sales_price: sales_price_id,
                                account_type: account_type_id,
                                account: account_id))
        end
      end
    end
  end
end
