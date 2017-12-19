# frozen_string_literal: true

module PlentyClient
  module Payment
    module Property
      include PlentyClient::Endpoint
      include PlentyClient::Request

      LIST_PAYMENT_PROPERTIES             = '/payments/properties'
      LIST_PAYMENT_PROPERTIES_BY_PAYMENT  = '/payments/{paymentId}/properties'
      FIND_PLUGIN_PAYMENT_PROPERTY        = '/payments/properties/{propertyId}'
      CREATE_PAYMENT_PROPERTY             = '/payments/properties'
      UPDATE_PAYMENT_PROPERTY_WITH_ID     = '/payments/properties/{propertyId}'
      UPDATE_PAYMENT_PROPERTY             = '/payments/properties'
      LIST_P_PROPERTIES_BY_TYPE_AND_VALUE = '/payments/property/{propertyTypeId}/{propertyValue}'
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
