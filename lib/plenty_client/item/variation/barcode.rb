# frozen_string_literal: true

module PlentyClient
  module Item
    module Variation
      class Barcode
        include PlentyClient::Endpoint
        include PlentyClient::Request

        ITEM_VARIATION_BARCODE_PATH     = '/items/{itemId}/variations/{variationId}'

        LIST_ITEM_VARIATION_BARCODES    = "#{ITEM_VARIATION_BARCODE_PATH}/variation_barcodes".freeze
        GET_ITEM_VARIATIONS_BARCODE     = "#{ITEM_VARIATION_BARCODE_PATH}/variation_barcodes/{barcodeId}".freeze
        CREATE_ITEM_VARIATIONS_BARCODE  = "#{ITEM_VARIATION_BARCODE_PATH}/variation_barcodes".freeze
        UPDATE_ITEM_VARIATIONS_BARCODE  = "#{ITEM_VARIATION_BARCODE_PATH}/variation_barcodes/{barcodeId}".freeze
        DELETE_ITEM_VARIATIONS_BARCODE  = "#{ITEM_VARIATION_BARCODE_PATH}/variation_barcodes/{barcodeId}".freeze

        class << self
          def list(item_id, variation_id, headers = {}, &block)
            get(build_endpoint("#{ITEM_VARIATION_BARCODE_PATH}#{LIST_ITEM_VARIATION_BARCODES}",
                               item: item_id,
                               variation: variation_id), headers, &block)
          end

          def find(item_id, variation_id, barcode_id, headers = {})
            get(build_endpoint("#{ITEM_VARIATION_BARCODE_PATH}#{GET_ITEM_VARIATIONS_BARCODE}",
                               item: item_id,
                               variation: variation_id,
                               barcode: barcode_id), headers, &block)
          end

          def create(item_id, variation_id, body = {})
            post(build_endpoint("#{ITEM_VARIATION_BARCODE_PATH}#{CREATE_ITEM_VARIATIONS_BARCODE}",
                                item: item_id,
                                variation: variation_id), body)
          end

          def update(item_id, variation_id, barcode_id, body = {})
            put(build_endpoint("#{ITEM_VARIATION_BARCODE_PATH}#{UPDATE_ITEM_VARIATIONS_BARCODE}",
                               item: item_id,
                               variation: variation_id,
                               barcode: barcode_id), body)
          end

          def destroy(item_id, variation_id, barcode_id)
            delete(build_endpoint("#{ITEM_VARIATION_BARCODE_PATH}#{DELETE_ITEM_VARIATIONS_BARCODE}",
                                  item: item_id,
                                  variation: variation_id,
                                  barcode: barcode_id))
          end
        end
      end
    end
  end
end
