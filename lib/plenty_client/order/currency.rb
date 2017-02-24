module PlentyClient
  module Order
    class Currency
      extend PlentyClient::Endpoint
      extend PlentyClient::Request

      LIST_CURRENCIES             = '/orders/currencies'.freeze
      FIND_CURRENCY_ISO           = '/orders/currencies/{currencyIso}'.freeze
      FIND_COUNTRIES_FOR_CURRENCY = '/orders/currencies/{currencyIso}/countries'.freeze
      FIND_CURRENCY_FOR_COUNTRY   = '/orders/currencies/countries/{countryId}'.freeze

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

