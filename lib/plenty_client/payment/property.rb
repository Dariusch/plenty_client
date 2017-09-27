module PlentyClient
  module Payment
    module Property
      include PlentyClient::Endpoint
      include PlentyClient::Request

      LIST_PAYMENT_PROPERTIES             = '/payments/properties'.freeze
      LIST_PAYMENT_PROPERTIES_BY_PAYMENT  = '/payments/{paymentId}/properties'.freeze
      FIND_PLUGIN_PAYMENT_PROPERTY        = '/payments/properties/{propertyId}'.freeze
      CREATE_PAYMENT_PROPERTY             = '/payments/properties'.freeze
      UPDATE_PAYMENT_PROPERTY_WITH_ID     = '/payments/properties/{propertyId}'.freeze
      UPDATE_PAYMENT_PROPERTY             = '/payments/properties'.freeze
      LIST_P_PROPERTIES_BY_TYPE_AND_VALUE = '/payments/property/{propertyTypeId}/{propertyValue}'.freeze
      class << self
        def list(headers = {}, &block)
          get(build_endpoint(LIST_PAYMENT_PROPERTIES), headers, &block)
        end

        def list_by_payment_id(payment_id, headers = {}, &block)
          get(build_endpoint(LIST_PAYMENT_PROPERTIES_BY_PAYMENT, payment: payment_id), headers, &block)
        end

        def list_by_type_and_value(property_type_id, property_value, headers = {}, &block)
          get(build_endpoint(LIST_P_PROPERTIES_BY_TYPE_AND_VALUE,
                             property_type: property_type_id,
                             property_value: property_value),
              headers, &block)
        end

        def find(payment_id, headers = {}, &block)
          get(build_endpoint(FIND_PLUGIN_PAYMENT_PROPERTY, payment: payment_id), headers, &block)
        end

        def create(body = {})
          post(build_endpoint(CREATE_PAYMENT_PROPERTY), body)
        end

        def update(body = {})
          put(build_endpoint(UPDATE_PAYMENT_PROPERTY), body)
        end

        # def update(payment_id, body = {})
        #   post(build_endpoint(UPDATE_PAYMENT_PROPERTY_WITH_ID, payment: payment_id), body)
        # end
      end
    end
  end
end
