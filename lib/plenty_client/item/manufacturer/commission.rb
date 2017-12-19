# frozen_string_literal: true

module PlentyClient
  module Item
    module Manufacturer
      class Commission
        include PlentyClient::Endpoint
        include PlentyClient::Request

        ITEM_MANUFACTURER_COMMISSION          = '/items/manufacturers/{manufacturerId}'

        LIST_ITEM_MANUFACTURER_COMMISSION     = '/commissions'
        GET_ITEMS_MANUFACTURER_COMMISSION     = '/commissions/{commissionId}'
        CREATE_ITEM_MANUFACTURER_COMMISSION   = '/commissions'
        UPDATE_ITEMS_MANUFACTURER_COMMISSION  = '/commissions/{commissionId}'
        DELETE_ITEMS_MANUFACTURER_COMMISSION  = '/commissions/{commissionId}'

        class << self
          def list(manufacturer_id, headers = {}, &block)
            get(build_endpoint("#{ITEM_MANUFACTURER_COMMISSION}#{LIST_ITEM_MANUFACTURER_COMMISSION}",
                               manufacturer: manufacturer_id),
                headers, &block)
          end

          def find(manufacturer_id, commission_id, headers = {}, &block)
            get(build_endpoint("#{ITEM_MANUFACTURER_COMMISSION}#{GET_ITEMS_MANUFACTURER_COMMISSION}",
                               manufacturer: manufacturer_id,
                               commission: commission_id),
                headers, &block)
          end

          def create(manufacturer_id, headers = {})
            post(build_endpoint("#{ITEM_MANUFACTURER_COMMISSION}#{CREATE_ITEM_MANUFACTURER_COMMISSION}",
                                manufacturer: manufacturer_id),
                 headers)
          end

          def update(manufacturer_id, commission_id, body = {})
            put(build_endpoint("#{ITEM_MANUFACTURER_COMMISSION}#{UPDATE_ITEMS_MANUFACTURER_COMMISSION}",
                               manufacturer: manufacturer_id,
                               commission: commission_id),
                body)
          end

          def destroy(manufacturer_id, commission_id)
            delete(build_endpoint("#{ITEM_MANUFACTURER_COMMISSION}#{DELETE_ITEMS_MANUFACTURER_COMMISSION}",
                                  manufacturer: manufacturer_id,
                                  commission: commission_id))
          end
        end
      end
    end
  end
end
