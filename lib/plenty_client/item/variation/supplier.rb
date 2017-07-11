module PlentyClient
  module Item
    module Variation
      class Supplier
        include PlentyClient::Endpoint
        include PlentyClient::Request

        ITEM_VARIATION_SUPPLIER_PATH    = '/items/{itemId}/variations/{variationId}'.freeze

        LIST_ITEM_VARIATIONS_SUPPLIER   = '/variation_suppliers'.freeze
        GET_ITEM_VARIATIONS_SUPPLIER    = '/variation_suppliers/{variationSupplierId}'.freeze
        CREATE_ITEM_VARIATIONS_SUPPLIER = '/variation_suppliers'.freeze
        UPDATE_ITEM_VARIATIONS_SUPPLIER = '/variation_suppliers/{variationSupplierId}'.freeze
        DELETE_ITEM_VARIATIONS_SUPPLIER = '/variation_suppliers/{variationSupplierId}'.freeze

        class << self
          def list(item_id, variation_id, headers = {}, &block)
            get(build_endpoint("#{ITEM_VARIATION_SUPPLIER_PATH}#{LIST_ITEM_VARIATIONS_SUPPLIER}",
                               item: item_id,
                               variation: variation_id), headers, &block)
          end

          def find(item_id, variation_id, supplier_id, headers = {}, &block)
            get(build_endpoint("#{ITEM_VARIATION_SUPPLIER_PATH}#{GET_ITEM_VARIATIONS_SUPPLIER}",
                               item: item_id,
                               variation: variation_id,
                               supplier: supplier_id), headers, &block)
          end

          def create(item_id, variation_id, body = {})
            post(build_endpoint("#{ITEM_VARIATION_SUPPLIER_PATH}#{CREATE_ITEM_VARIATIONS_SUPPLIER}",
                                item: item_id,
                                variation: variation_id), body)
          end

          def update(item_id, variation_id, supplier_id, body = {})
            put(build_endpoint("#{ITEM_VARIATION_SUPPLIER_PATH}#{CREATE_ITEM_VARIATIONS_SUPPLIER}",
                                item: item_id,
                                variation: variation_id), body)
          end

          def destroy(item_id, variation_id, supplier_id)
            delete(build_endpoint("#{ITEM_VARIATION_SUPPLIER_PATH}#{DELETE_ITEM_VARIATIONS_SUPPLIER}",
                                  item: item_id,
                                  variation: variation_id,
                                  supplier: supplier_id))
          end
        end
      end
    end
  end
end
