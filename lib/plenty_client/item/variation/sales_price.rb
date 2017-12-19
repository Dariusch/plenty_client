# frozen_string_literal: true

module PlentyClient
  module Item
    module Variation
      class SalesPrice
        include PlentyClient::Endpoint
        include PlentyClient::Request

        ITEM_VARIATION_SALES_PRICES_PATH    = '/items/{itemId}/variations/{variationId}'

        LIST_ITEM_VARIATIONS_SALES_PRICES   = '/variation_sales_prices'
        GET_ITEM_VARIATIONS_SALES_PRICES    = '/variation_sales_prices/{priceId}'
        CREATE_ITEM_VARIATIONS_SALES_PRICES = '/variation_sales_prices'
        UPDATE_ITEM_VARIATIONS_SALES_PRICES = '/variation_sales_prices/{priceId}'
        DELETE_ITEM_VARIATIONS_SALES_PRICES = '/variation_sales_prices/{priceId}'

        class << self
          def list(item_id, variation_id, headers = {}, &block)
            get(build_endpoint("#{ITEM_VARIATION_SALES_PRICES_PATH}#{LIST_ITEM_VARIATIONS_SALES_PRICES}",
                               item: item_id, variation: variation_id),
                headers, &block)
          end

          def find(item_id, variation_id, price_id, headers = {}, &block)
            get(build_endpoint("#{ITEM_VARIATION_SALES_PRICES_PATH}#{GET_ITEM_VARIATIONS_SALES_PRICES}",
                               item: item_id, variation: variation_id, price: price_id),
                headers, &block)
          end

          def create(item_id, variation_id, body = {})
            post(build_endpoint("#{ITEM_VARIATION_SALES_PRICES_PATH}#{CREATE_ITEM_VARIATIONS_SALES_PRICES}",
                                item: item_id, variation: variation_id),
                 body)
          end

          def update(item_id, variation_id, price_id, body = {})
            put(build_endpoint("#{ITEM_VARIATION_SALES_PRICES_PATH}#{UPDATE_ITEM_VARIATIONS_SALES_PRICES}",
                               item: item_id, variation: variation_id, price: price_id),
                body)
          end

          def destroy(item_id, variation_id, price_id)
            delete(build_endpoint("#{ITEM_VARIATION_SALES_PRICES_PATH}#{DELETE_ITEM_VARIATIONS_SALES_PRICES}",
                                  item: item_id, variation: variation_id, price: price_id))
          end
        end
      end
    end
  end
end
