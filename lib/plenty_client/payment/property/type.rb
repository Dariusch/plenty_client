module PlentyClient
  module Payment
    module Property
      module Type
        include PlentyClient::Endpoint
        include PlentyClient::Request

        LIST_PAYMENT_PROPERTY_TYPES           = '/payments/properties/types'.freeze
        FIND_PAYMENT_PROPERTY_TYPE            = '/payments/properties/types/{typeId}'.freeze
        CREATE_PAYMENT_PROPERTY_TYPE          = '/payments/properties/types'.freeze
        UPDATE_PAYMENT_PROPERTY_TYPE_WITH_ID  = '/payments/properties/types/{typeId}'.freeze
        UPDATE_PAYMENT_PROPERTY_TYPE          = '/payments/properties/types'.freeze

        class << self
          def list(headers = {}, &block)
            get(build_endpoint(LIST_PAYMENT_PROPERTY_TYPES), headers, &block)
          end

          def find(type_id, headers = {}, &block)
            get(build_endpoint(FIND_PAYMENT_PROPERTY_TYPE, type: type_id), headers, &block)
          end

          def create(body = {})
            post(build_endpoint(CREATE_PAYMENT_PROPERTY_TYPE), body)
          end

          def update(body = {})
            put(build_endpoint(UPDATE_PAYMENT_PROPERTY_TYPE), body)
          end

          # def update(type_id, body = {})
          #   post(build_endpoint(UPDATE_PAYMENT_PROPERTY_TYPE_WITH_ID, payment: type_id), body)
          # end
        end
      end
    end
  end
end
