# frozen_string_literal: true

module PlentyClient
  module Item
    module Variation
      class SalesPrice
        include PlentyClient::Endpoint
        include PlentyClient::Request

        BASE_PATH     = '/items/{itemId}/variations/{variationId}'
        PLURAL_PATH   = BASE_PATH + '/variation_sales_prices'
        SINGULAR_PATH = PLURAL_PATH + '/{priceId}'
        BULK_PATH     = '/items/variations/variation_sales_prices'

        class << self
          def list(item_id, variation_id, headers = {}, &block)
            get(build_endpoint(PLURAL_PATH, item: item_id, variation: variation_id),
                headers, &block)
          end

          def find(item_id, variation_id, price_id, headers = {}, &block)
            get(build_endpoint(SINGULAR_PATH, item: item_id, variation: variation_id, price: price_id),
                headers, &block)
          end

          def create(item_id, variation_id, body = {})
            post(build_endpoint(PLURAL_PATH, item: item_id, variation: variation_id), body)
          end

          def update(item_id, variation_id, price_id, body = {})
            put(build_endpoint(SINGULAR_PATH, item: item_id, variation: variation_id, price: price_id), body)
          end

          def destroy(item_id, variation_id, price_id)
            delete(build_endpoint(SINGULAR_PATH, item: item_id, variation: variation_id, price: price_id))
          end

          def bulk_update(body = {})
            put(BULK_PATH, body)
          end
        end
      end
    end
  end
end
