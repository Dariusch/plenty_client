# frozen_string_literal: true

# TODO: Fix class, PlentyMarkets changed syntax
module PlentyClient
  module Item
    module Variation
      class Bundle
        include PlentyClient::Endpoint
        include PlentyClient::Request

        ITEM_VARIATION_BUNDLE_PATH    = '/items/{itemId}/variations/{variationId}'

        LIST_ITEM_VARIATIONS_BUNDLE   = '/variation_bundles'
        GET_ITEM_VARIATIONS_BUNDLE    = '/variation_bundles/{bundleId}'
        CREATE_ITEM_VARIATIONS_BUNDLE = '/variation_bundles'
        UPDATE_ITEM_VARIATIONS_BUNDLE = '/variation_bundles/{bundleId}'
        DELETE_ITEM_VARIATIONS_BUNDLE = '/variation_bundles/{bundleId}'

        class << self
          def list(item_id, variation_id, headers = {}, &block)
            get(build_endpoint("#{ITEM_VARIATION_BUNDLE_PATH}#{LIST_ITEM_VARIATIONS_BUNDLE}",
                               item: item_id, variation: variation_id),
                headers, &block)
          end

          def find(item_id, variation_id, bundle_id, headers = {}, &block)
            get(build_endpoint("#{ITEM_VARIATION_BUNDLE_PATH}#{GET_ITEM_VARIATIONS_BUNDLE}",
                               item: item_id, variation: variation_id, bundle: bundle_id),
                headers, &block)
          end

          def create(item_id, variation_id, body = {})
            post(build_endpoint("#{ITEM_VARIATION_BUNDLE_PATH}#{CREATE_ITEM_VARIATIONS_BUNDLE}",
                                item: item_id, variation: variation_id),
                 body)
          end

          def update(item_id, variation_id, bundle_id, body = {})
            put(build_endpoint("#{ITEM_VARIATION_BUNDLE_PATH}#{UPDATE_ITEM_VARIATIONS_BUNDLE}",
                               item: item_id, variation: variation_id, bundle: bundle_id),
                body)
          end

          def destroy(item_id, variation_id, bundle_id)
            delete(build_endpoint("#{ITEM_VARIATION_BUNDLE_PATH}#{DELETE_ITEM_VARIATIONS_BUNDLE}",
                                  item: item_id, variation: variation_id, bundle: bundle_id))
          end
        end
      end
    end
  end
end
