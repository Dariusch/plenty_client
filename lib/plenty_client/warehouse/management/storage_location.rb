module PlentyClient
  module Warehouse
    module Management
      class StorageLocation
        include PlentyClient::Endpoint
        include PlentyClient::Request

        WM_STORAGE_LOCATION_BASE_PATH = '/stockmanagement/warehouses/{warehouseId}/management'.freeze
        WM_SL_LIST_STORAGE_LOCATIONS  = '/racks/{rackId}/shelves/{shelfId}/storageLocations'.freeze
        WM_SL_FIND_STORAGE_LOCATIONS  = '/racks/{rackId}/shelves/{shelfId}/storageLocations/{storageLocationId}'.freeze
        WM_SL_CREATE_STORAGE_LOCATION = '/racks/{rackId}/shelves/{shelfId}/storageLocations'.freeze

        class << self
          def list(warehouse_id, rack_id, shelf_id, headers = {}, &block)
            get(build_endpoint("#{WM_STORAGE_LOCATION_BASE_PATH}#{WM_SL_LIST_STORAGE_LOCATIONS}",
                               warehouse: warehouse_id,
                               rack: rack_id,
                               shelf: shelf_id),
                headers, &block)
          end

          def find(warehouse_id, rack_id, shelf_id, storage_location_id, headers = {}, &block)
            get(build_endpoint("#{WM_STORAGE_LOCATION_BASE_PATH}#{WM_SL_FIND_STORAGE_LOCATIONS}",
                               warehouse: warehouse_id,
                               rack: rack_id,
                               shelf: shelf_id,
                               storage_location: storage_location_id),
                headers, &block)
          end

          def create(warehouse_id, rack_id, shelf_id, body = {})
            post(build_endpoint("#{WM_STORAGE_LOCATION_BASE_PATH}#{WM_SL_CREATE_STORAGE_LOCATION}",
                                warehouse: warehouse_id,
                                rack: rack_id,
                                shelf: shelf_id),
                 body)
          end
        end
      end
    end
  end
end
