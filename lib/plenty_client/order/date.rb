# frozen_string_literal: true

module PlentyClient
  module Order
    class Date
      include PlentyClient::Endpoint
      include PlentyClient::Request

      LIST_ORDER_DATE_TYPE_NAMES  = '/orders/dates/types/{typeId}/names'
      FIND_ORDER_DATE_TYPE_NAME   = '/orders/dates/types/{typeId}/names/{lang}'
      LIST_ORDER_DATES            = '/orders/{orderId}/dates'
      FIND_ORDER_DATE             = '/orders/{orderId}/dates/{typeId}'

      class << self
        def list_date_type_names(type_id, headers = {}, &block)
          get(build_endpoint(LIST_ORDER_DATE_TYPE_NAMES, type: type_id), headers, &block)
        end

        def find_date_type_name(type_id, lang, headers = {}, &block)
          get(build_endpoint(FIND_ORDER_DATE_TYPE_NAME, type: type_id, lang: lang), headers, &block)
        end

        def list(order_id, headers = {}, &block)
          get(build_endpoint(LIST_ORDER_DATES, order: order_id), headers, &block)
        end

        def find(order_id, type_id, headers = {}, &block)
          get(build_endpoint(FIND_ORDER_DATE, order: order_id, type: type_id), headers, &block)
        end
      end
    end
  end
end
