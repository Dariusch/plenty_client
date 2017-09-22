module PlentyClient
  module Warehouse
    include PlentyClient::Endpoint
    include PlentyClient::Request

    LIST_WAREHOUSES  = '/stockmanagement/warehouses'.freeze
    FIND_WAREHOUSE   = '/stockmanagement/warehouses/{warehouseId}'.freeze
    CREATE_WAREHOUSE = '/stockmanagement/warehouses'.freeze

    class << self
      def list(headers = {}, &block)
        get(build_endpoint(LIST_STOCK), headers, &block)
      end

      def find(warehouse_id, headers = {}, &block)
        get(build_endpoint(FIND_WAREHOUSE, warehouse: warehouse_id), headers, &block)
      end

      def create(body = {})
        post(build_endpoint(CREATE_WAREHOUSE), body)
      end
    end
  end
end
