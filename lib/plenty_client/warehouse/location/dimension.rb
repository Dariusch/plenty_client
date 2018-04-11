# frozen_string_literal: true

# PlentyClient::Warehouse::Location::Dimension
module PlentyClient
  module Warehouse
    module Location
      module Dimension
        include PlentyClient::Request
        extend PlentyClient::Concerns::RestRoutes

        LIST_URL = '/warehouses/%<warehouse_id>d/locations/dimensions'

        class << self
          def list(warehouse_id, body = {}, &block)
            get(format(LIST_URL, warehouse_id: warehouse_id), body, &block)
          end

          private

          def base_path
            '/warehouses/locations/dimensions'
          end
        end
      end
    end
  end
end
