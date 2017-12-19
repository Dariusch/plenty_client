# frozen_string_literal: true

module PlentyClient
  module Stock
    include PlentyClient::Endpoint
    include PlentyClient::Request

    LIST_STOCK         = '/stockmanagement/stock'
    LIST_STOCK_BY_TYPE = '/stockmanagement/stock/types/{type}'
    REDISTRIBUTE_STOCK = '/stockmanagement/stock/redistribute'

    class << self
      def list(headers = {}, &block)
        get(build_endpoint(LIST_STOCK), headers, &block)
      end

      def list_by_type(type_string, headers = {}, &block)
        get(build_endpoint(LIST_STOCK_BY_TYPE, type_string: type_string), headers, &block)
      end

      def redistribute(body = {})
        put(build_endpoint(REDISTRIBUTE_STOCK), body)
      end
    end
  end
end
