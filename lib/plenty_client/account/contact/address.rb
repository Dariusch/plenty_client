# frozen_string_literal: true

module PlentyClient
  module Account
    module Contact
      class Address
        include PlentyClient::Endpoint
        include PlentyClient::Request

        CONTACT_ADDRESS_BASE_PATH   = '/accounts/contacts/{contactId}'

        LIST_A_CONTACT_ADDRESSES    = '/addresses/{addressTypeId}'
        CREATE_A_CONTACT_ADDRESS    = '/addresses'
        UPDATE_A_CONTACT_ADDRESS    = '/addresses/{addressId}'
        DELETE_A_CONTACT_ADDRESS    = '/addresses/{addressId}'
        SET_PRIMARY_CONTACT_ADDRESS = '/addresses/{addressId}/types/{addressTypeId}/primary'

        class << self
          def list(contact_id, address_type = '', headers = {}, &block)
            get(build_endpoint("#{CONTACT_ADDRESS_BASE_PATH}#{LIST_A_CONTACT_ADDRESSES}",
                               contact: contact_id,
                               address_type: address_type),
                headers, &block)
          end

          def create(contact_id, body = {})
            post(build_endpoint("#{CONTACT_ADDRESS_BASE_PATH}#{CREATE_A_CONTACT_ADDRESS}",
                                contact: contact_id), body)
          end

          def update(contact_id, address_id, body = {})
            put(build_endpoint("#{CONTACT_ADDRESS_BASE_PATH}#{UPDATE_A_CONTACT_ADDRESS}",
                               contact: contact_id,
                               address: address_id),
                body)
          end

          def destroy(contact_id, address_id, body = {})
            delete(build_endpoint("#{CONTACT_ADDRESS_BASE_PATH}#{DELETE_A_CONTACT_ADDRESS}",
                                  contact: contact_id,
                                  address: address_id),
                   body)
          end

          def update_primary(contact_id, address_id, address_type, body = {})
            put(build_endpoint("#{CONTACT_ADDRESS_BASE_PATH}#{SET_PRIMARY_CONTACT_ADDRESS}",
                               contact: contact_id,
                               address: address_id,
                               address_type: address_type),
                body)
          end
        end
      end
    end
  end
end
