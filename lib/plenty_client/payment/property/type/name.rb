# frozen_string_literal: true

module PlentyClient
  module Payment
    module Property
      module Type
        class Name
          include PlentyClient::Endpoint
          include PlentyClient::Request

          LIST_PAYMENT_PROPERTY_TYPE_NAMES           = '/payments/properties/types/names/{lang}'
          FIND_PAYMENT_PROPERTY_TYPE_NAME            = '/payments/properties/types/names/{nameId}'
          CREATE_PAYMENT_PROPERTY_TYPE_NAME          = '/payments/properties/types/names'
          UPDATE_PAYMENT_PROPERTY_TYPE_NAME_WITH_ID  = '/payments/properties/types/names/{nameId}'
          UPDATE_PAYMENT_PROPERTY_TYPE_NAME          = '/payments/properties/types/names'

          class << self
            def list(lang, headers = {}, &block)
              get(build_endpoint(LIST_PAYMENT_PROPERTY_TYPE_NAMES, lang: lang), headers, &block)
            end

            def find(name_id, headers = {}, &block)
              get(build_endpoint(FIND_PAYMENT_PROPERTY_TYPE_NAME, name: name_id), headers, &block)
            end

            def create(body = {})
              post(build_endpoint(CREATE_PAYMENT_PROPERTY_TYPE_NAME), body)
            end

            def update(body = {})
              put(build_endpoint(UPDATE_PAYMENT_PROPERTY_TYPE_NAME), body)
            end

            # def update(type_id, body = {})
            #   post(build_endpoint(UPDATE_PAYMENT_PROPERTY_TYPE_NAME_WITH_ID, payment: type_id), body)
            # end
          end
        end
      end
    end
  end
end
