# frozen_string_literal: true

module PlentyClient
  module Warehouse
    include PlentyClient::Request
    extend PlentyClient::Concerns::RestPaths

    skip_rest_paths :update, :destroy

    private_class_method def self.base_path
      '/stockmanagement/warehouses'
    end
  end
end
