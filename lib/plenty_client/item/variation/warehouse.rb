module PlentyClient
  module Item
    module Variation
      class Warehouse
        extend PlentyClient::Endpoint
        extend PlentyClient::Request

        ITEM_VARIATION_WAREHOUSE_PATH    = '/items/{itemId}/variations/{variationId}'.freeze

        LIST_ITEM_VARIATIONS_WAREHOUSE   = '/variation_warehouses'.freeze
        GET_ITEM_VARIATIONS_WAREHOUSE    = '/variation_warehouses/{warehouseId}'.freeze
        CREATE_ITEM_VARIATIONS_WAREHOUSE = '/variation_warehouses'.freeze
        UPDATE_ITEM_VARIATIONS_WAREHOUSE = '/variation_warehouses/{warehouseId}'.freeze
        DELETE_ITEM_VARIATIONS_WAREHOUSE = '/variation_warehouses/{warehouseId}'.freeze

        class << self
          def list(item_id, variation_id, headers = {}, &block)
            get(build_endpoint("#{ITEM_VARIATION_WAREHOUSE_PATH}#{LIST_ITEM_VARIATIONS_WAREHOUSE}",
                               item: item_id,
                               variation: variation_id), headers, &block)
          end

          def find(item_id, variation_id, warehouse_id, headers = {}, &block)
            get(build_endpoint("#{ITEM_VARIATION_WAREHOUSE_PATH}#{GET_ITEM_VARIATIONS_WAREHOUSE}",
                               item: item_id,
                               variation: variation_id,
                               warehouse: warehouse_id), headers, &block)
          end

          def create(item_id, variation_id, body = {})
            post(build_endpoint("#{ITEM_VARIATION_WAREHOUSE_PATH}#{CREATE_ITEM_VARIATIONS_WAREHOUSE}",
                                item: item_id,
                                variation: variation_id), body)
          end

          def update(item_id, variation_id, warehouse_id, body = {})
            put(build_endpoint("#{ITEM_VARIATION_WAREHOUSE_PATH}#{CREATE_ITEM_VARIATIONS_WAREHOUSE}",
                                item: item_id,
                                variation: variation_id), body)
          end

          def delete(item_id, variation_id, warehouse_id)
            delete(build_endpoint("#{ITEM_VARIATION_WAREHOUSE_PATH}#{DELETE_ITEM_VARIATIONS_WAREHOUSE}",
                                  item: item_id,
                                  variation: variation_id,
                                  warehouse: warehouse_id))
          end
        end
      end
    end
  end
end
