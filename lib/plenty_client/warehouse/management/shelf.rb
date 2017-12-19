# frozen_string_literal: true

module PlentyClient
  module Warehouse
    module Management
      class Shelf
        include PlentyClient::Endpoint
        include PlentyClient::Request

        WM_WAREHOUSE_MGMT_BASE_PATH = '/stockmanagement/warehouses/{warehouseId}/management'

        WM_LIST_SHELF   = '/racks/{rackId}/shelves'
        WM_FIND_SHELF   = '/racks/{rackId}/shelves/{shelfId}'
        WM_CREATE_SHELF = '/racks/{rackId}/shelves'

        class << self
          def list(warehouse_id, rack_id, headers = {}, &block)
            get(build_endpoint("#{WM_WAREHOUSE_MGMT_BASE_PATH}#{WM_LIST_SHELF}",
                                warehouse: warehouse_id, rack: rack_id),
                 headers, &block)
          end

          def find(warehouse_id, rack_id, shelf_id, headers = {}, &block)
            get(build_endpoint("#{WM_WAREHOUSE_MGMT_BASE_PATH}#{WM_FIND_SHELF}",
                               warehouse: warehouse_id,
                               rack: rack_id,
                               shelf: shelf_id),
                headers, &block)
          end

          def create(warehouse_id, rack_id, body = {})
            post(build_endpoint("#{WM_WAREHOUSE_MGMT_BASE_PATH}#{WM_CREATE_SHELF}",
                                warehouse: warehouse_id, rack: rack_id),
                 body)
          end
        end
      end
    end
  end
end
