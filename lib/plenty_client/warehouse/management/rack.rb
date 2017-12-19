# frozen_string_literal: true

module PlentyClient
  module Warehouse
    module Management
      class Rack
        include PlentyClient::Endpoint
        include PlentyClient::Request

        WM_WAREHOUSE_MGMT_BASE_PATH = '/stockmanagement/warehouses/{warehouseId}/management'

        WM_LIST_RACKS     = '/racks'
        WM_FIND_RACKS     = '/racks/{rackId}'
        WM_CREATE_RACK    = '/racks'

        class << self
          def list(warehouse_id, headers = {}, &block)
            get(build_endpoint("#{WM_WAREHOUSE_MGMT_BASE_PATH}#{WM_LIST_RACKS}",
                               warehouse: warehouse_id),
                headers, &block)
          end

          def find(warehouse_id, rack_id, headers = {}, &block)
            get(build_endpoint("#{WM_WAREHOUSE_MGMT_BASE_PATH}#{WM_FIND_RACKS}",
                               warehouse: warehouse_id,
                               rack: rack_id),
                headers, &block)
          end

          def create(warehouse_id, body = {})
            post(build_endpoint("#{WM_WAREHOUSE_MGMT_BASE_PATH}#{WM_CREATE_RACK}", warehouse: warehouse_id), body)
          end
        end
      end
    end
  end
end
