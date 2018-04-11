# frozen_string_literal: true

# PlentyClient::Warehouse::Location::Level
module PlentyClient
  module Warehouse
    module Location
      module Level
        include PlentyClient::Request
        extend PlentyClient::Concerns::RestRoutes

        LIST_URL = '/warehouses/%<warehouse_id>d/locations/levels'

        class << self
          def list(warehouse_id, body = {}, &block)
            get(format(LIST_URL, warehouse_id: warehouse_id), body, &block)
          end

          private

          def base_path
            '/warehouses/locations/levels'
          end
        end
      end
    end
  end
end
