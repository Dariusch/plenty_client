# frozen_string_literal: true

# PlentyClient::Warehouse::Location::Dimension
module PlentyClient
  module Warehouse
    module Location
      module Dimension
        include PlentyClient::Request
        extend PlentyClient::Concerns::SinglePaths

        private_class_method def self.base_path
          '/warehouses/locations/dimensions'
        end
      end
    end
  end
end
