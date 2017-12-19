# frozen_string_literal: true

module PlentyClient
  module Warehouse
    include PlentyClient::Endpoint
    include PlentyClient::Request

    LIST_WAREHOUSES  = '/stockmanagement/warehouses'
    FIND_WAREHOUSE   = '/stockmanagement/warehouses/{warehouseId}'
    CREATE_WAREHOUSE = '/stockmanagement/warehouses'

    class << self
      def list(headers = {}, &block)
        get(build_endpoint(LIST_WAREHOUSES), headers, &block)
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
