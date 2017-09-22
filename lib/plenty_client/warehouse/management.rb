module PlentyClient
  module Warehouse
    module Management
      include PlentyClient::Endpoint
      include PlentyClient::Request

      WM_STORAGE_LOCATION_BASE_PATH = '/stockmanagement/warehouses/{warehouseId}/management'.freeze
      WM_LIST_STORAGE_LOCATIONS     = '/storageLocations'.freeze
      WM_FIND_STORAGE_LOCATIONS     = '/storageLocations/{storageLocationId}'.freeze

      class << self
        def list(warehouse_id, headers = {}, &block)
          get(build_endpoint("#{WM_STORAGE_LOCATION_BASE_PATH}#{WM_LIST_STORAGE_LOCATIONS}",
                             warehouse: warehouse_id),
              headers, &block)
        end

        def find(warehouse_id, storage_location_id, headers = {}, &block)
          get(build_endpoint("#{WM_STORAGE_LOCATION_BASE_PATH}#{WM_FIND_STORAGE_LOCATIONS}",
                             warehouse: warehouse_id,
                             storage_location: storage_location_id),
              headers, &block)
        end
      end
    end
  end
end
