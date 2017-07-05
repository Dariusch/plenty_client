module PlentyClient
  module Item
    class Barcode
      include PlentyClient::Endpoint
      include PlentyClient::Request

      LIST_ALL_BARCODES         = '/items/barcodes'.freeze
      CREATE_BARCODE            = '/items/barcodes'.freeze
      GET_BARCODE               = '/items/barcodes/{barcodeId}'.freeze
      UPDATE_BARCODE            = '/items/barcodes/{barcodeId}'.freeze
      DELETE_BARCODE            = '/items/barcodes/{barcodeId}'.freeze
      DEACTIVATE_REFERRER       = '/items/barcodes/{barcodeId}/referrer/{referrerId}'.freeze
      ACTIVATE_RERERRER         = '/items/barcodes/{barcodeId}/referrer'.freeze
      LIST_BARCODES_BY_TYPE     = '/items/barcodes/type/{type}'.freeze
      LIST_BARCODES_BY_REFERRER = '/items/barcodes/referrer/{referrerId}'.freeze

      class << self
        def list(headers = {}, &block)
          get(build_endpoint(LIST_ALL_BARCODES), headers, &block)
        end

        def list_by_type(type_string, headers = {}, &block)
          get(build_endpoint(LIST_BARCODES_BY_TYPE, type_string: type_string), headers, &block)
        end

        def list_by_referrer(referrer_id, headers = {}, &block)
          get(build_endpoint(LIST_BARCODES_BY_REFERRER, referrer: referrer_id), headers, &block)
        end

        def find(barcode_id, headers = {}, &block)
          get(build_endpoint(GET_BARCODE, barcode: barcode_id), headers, &block)
        end

        def create(body = {})
          post(build_endpoint(CREATE_BARCODE), body)
        end

        def update(barcode_id, body = {})
          post(build_endpoint(UPDATE_BARCODE, barcode: barcode_id), body)
        end

        def delete(barcode_id)
          delete(build_endpoint(DELETE_BARCODE, barcode: barcode_id))
        end

        def deactivate_referrer(barcode_id, referrer_id)
          delete(build_endpoint(DEACTIVATE_REFERRER, barcode: barcode_id, referrer: referrer_id))
        end

        def activate_referrer(barcode_id, body = {})
          post(build_endpoint(ACTIVATE_RERERRER, barcode: barcode_id), body)
        end
      end
    end
  end
end
