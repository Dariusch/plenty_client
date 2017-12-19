# frozen_string_literal: true

module PlentyClient
  module Order
    class Currency
      include PlentyClient::Endpoint
      include PlentyClient::Request

      LIST_CURRENCIES             = '/orders/currencies'
      FIND_CURRENCY_ISO           = '/orders/currencies/{currencyIso}'
      FIND_COUNTRIES_FOR_CURRENCY = '/orders/currencies/{currencyIso}/countries'
      FIND_CURRENCY_FOR_COUNTRY   = '/orders/currencies/countries/{countryId}'

      class << self
        def list(headers = {}, &block)
          get(build_endpoint(LIST_CURRENCIES), headers, &block)
        end

        def find(currency_iso, headers = {}, &block)
          get(build_endpoint(FIND_CURRENCY_ISO, currency: currency_iso), headers, &block)
        end

        def find_countries(currency_iso, headers = {}, &block)
          get(build_endpoint(FIND_COUNTRIES_FOR_CURRENCY, currency: currency_iso), headers, &block)
        end

        def find_currency(country_id, headers = {}, &block)
          get(build_endpoint(FIND_CURRENCY_FOR_COUNTRY, country: country_id), headers, &block)
        end
      end
    end
  end
end
