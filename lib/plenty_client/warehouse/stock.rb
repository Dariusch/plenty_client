module PlentyClient
  module Warehouse
    class Stock
      include PlentyClient::Endpoint
      include PlentyClient::Request

      STOCK_MANAGEMENT_BY_WAREHOUSE_BASE_PATH = '/stockmanagement/warehouses/{warehouseId}'.freeze

      LIST_STOCK              = '/stock'.freeze
      LIST_STOCK_BY_LOCATION  = '/stock/storageLocations'.freeze
      LIST_STOCK_MOVEMENTS    = '/stock/movements'.freeze
      CORRECT_STOCK           = '/stock/correction'.freeze
      BOOK_INCOMING_STOCK     = '/stock/bookIncomingItems'.freeze

      class << self
        def list(warehouse_id, headers = {}, &block)
          get(build_endpoint("#{STOCK_MANAGEMENT_BY_WAREHOUSE_BASE_PATH}#{LIST_STOCK}",
                             warehouse: warehouse_id),
              headers, &block)
        end

        def list_movements(warehouse_id, headers = {}, &block)
          get(build_endpoint("#{STOCK_MANAGEMENT_BY_WAREHOUSE_BASE_PATH}#{LIST_STOCK_MOVEMENTS}",
                             warehouse: warehouse_id),
              headers, &block)
        end

        def list_by_location(warehouse_id, headers = {}, &block)
          get(build_endpoint("#{STOCK_MANAGEMENT_BY_WAREHOUSE_BASE_PATH}#{LIST_STOCK_BY_LOCATION}",
                             warehouse: warehouse_id),
              headers, &block)
        end

        def correction(warehouse_id, body = {})
          put(build_endpoint("#{STOCK_MANAGEMENT_BY_WAREHOUSE_BASE_PATH}#{CORRECT_STOCK}",
                             warehouse: warehouse_id),
              body)
        end

        def book_incoming(warehouse_id, body = {})
          put(build_endpoint("#{STOCK_MANAGEMENT_BY_WAREHOUSE_BASE_PATH}#{BOOK_INCOMING_STOCK}",
                             warehouse: warehouse_id),
              body)
        end
      end
    end
  end
end
