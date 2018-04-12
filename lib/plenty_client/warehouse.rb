# frozen_string_literal: true

module PlentyClient
  module Warehouse
    include PlentyClient::Request
    extend PlentyClient::Concerns::RestRoutes

    skip_rest_routes :update, :destroy

    private_class_method def self.base_path
      '/stockmanagement/warehouses'
    end
  end
end
