# frozen_string_literal: true

module PlentyClient
  module Warehouse
    module Location
      module Level
        include PlentyClient::Request

        BASE_PATH = '/warehouses/locations/levels'
        SINGLE_PATH = BASE_PATH + '%<id>d'

        class << self
          def create(headers = {}, &block)
            post(BASE_PATH, headers, &block)
          end

          def find(id, headers = {}, &block)
            get(single_path(id), headers, &block)
          end

          def update(id, headers = {}, &block)
            put(single_path(id), headers, &block)
          end

          def destroy(id, headers = {}, &block)
            delete(single_path(id), headers, &block)
          end

          private

          def single_path(id)
            format(SINGLE_PATH, id: id)
          end
        end
      end
    end
  end
end
