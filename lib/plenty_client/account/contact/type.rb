# frozen_string_literal: true

module PlentyClient
  module Account
    module Contact
      class Type
        include PlentyClient::Endpoint
        include PlentyClient::Request

        LIST_A_CONTACT_TYPES   = '/accounts/contacts/types'
        FIND_A_CONTACT_TYPE    = '/accounts/contacts/types/{typeId}'
        CREATE_A_CONTACT_TYPE  = '/accounts/contacts/types'
        UPDATE_A_CONTACT_TYPE  = '/accounts/contacts/types/{typeId}'
        DELETE_A_CONTACT_TYPE  = '/accounts/contacts/types/{typeId}'

        class << self
          def list(headers = {}, &block)
            get(build_endpoint(LIST_A_CONTACT_TYPES), headers, &block)
          end

          def find(type, headers = {}, &block)
            get(build_endpoint(FIND_A_CONTACT_TYPE, type: type), headers, &block)
          end

          def create(body = {})
            post(CREATE_A_CONTACT_TYPE, body)
          end

          def update(type, body = {})
            put(build_endpoint(UPDATE_A_CONTACT_TYPE, type: type), body)
          end

          def destroy(type, body = {})
            delete(build_endpoint(DELETE_A_CONTACT_TYPE, type: type), body)
          end
        end
      end
    end
  end
end
