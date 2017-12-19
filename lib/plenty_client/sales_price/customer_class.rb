# frozen_string_literal: true

module PlentyClient
  module SalesPrice
    class CustomerClass
      include PlentyClient::Endpoint
      include PlentyClient::Request

      SALES_PRICE_PATH = '/items/sales_prices/{salesPriceId}'
      LIST_SALES_PRICE_CUSTOMER_CLASSES       = '/customer_classes'
      ACTIVATE_SALES_PRICE_CUSTOMER_CLASSES   = '/customer_classes'
      DEACTIVATE_SALES_PRICE_CUSTOMER_CLASSES = '/customer_classes/{customerClassId}'

      class << self
        def list(sales_price_id, headers = {}, &block)
          get(build_endpoint("#{SALES_PRICE_PATH}#{LIST_SALES_PRICE_CUSTOMER_CLASSES}",
                             sales_price: sales_price_id), headers, &block)
        end

        def activate(sales_price_id, headers = {})
          post(build_endpoint("#{SALES_PRICE_PATH}#{ACTIVATE_SALES_PRICE_CUSTOMER_CLASSES}",
                              sales_price: sales_price_id), headers)
        end

        def deactivate(sales_price_id, customer_class_id)
          delete(build_endpoint("#{SALES_PRICE_PATH}#{DEACTIVATE_SALES_PRICE_CUSTOMER_CLASSES}",
                                sales_price: sales_price_id,
                                customer_class: customer_class_id))
        end
      end
    end
  end
end
