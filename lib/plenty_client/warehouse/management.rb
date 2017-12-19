# frozen_string_literal: true

module PlentyClient
  module Warehouse
    module Management
      include PlentyClient::Endpoint
      include PlentyClient::Request

      WM_STORAGE_LOCATION_BASE_PATH = '/stockmanagement/warehouses/{warehouseId}/management'
      WM_LIST_STORAGE_LOCATIONS     = '/storageLocations'
      WM_FIND_STORAGE_LOCATIONS     = '/storageLocations/{storageLocationId}'
      WM_LIST_RACKS                 = '/racks'
      WM_FIND_RACKS                 = '/racks/{rackId}'

      class << self
        def list_locations(warehouse_id, headers = {}, &block)
          get(build_endpoint("#{WM_STORAGE_LOCATION_BASE_PATH}#{WM_LIST_STORAGE_LOCATIONS}",
                             warehouse: warehouse_id),
              headers, &block)
        end

        def find_location(warehouse_id, storage_location_id, headers = {}, &block)
          get(build_endpoint("#{WM_STORAGE_LOCATION_BASE_PATH}#{WM_FIND_STORAGE_LOCATIONS}",
                             warehouse: warehouse_id,
                             storage_location: storage_location_id),
              headers, &block)
        end

        def list_racks(warehouse_id, headers = {}, &block)
          get(build_endpoint("#{WM_STORAGE_LOCATION_BASE_PATH}#{WM_LIST_RACKS}",
                             warehouse: warehouse_id),
              headers, &block)
        end

        def find_racks(warehouse_id, headers = {}, &block)
          get(build_endpoint("#{WM_STORAGE_LOCATION_BASE_PATH}#{WM_FIND_RACKS}",
                             warehouse: warehouse_id),
              headers, &block)
        end
      end
    end
  end
end
