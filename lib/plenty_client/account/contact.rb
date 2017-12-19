# frozen_string_literal: true

module PlentyClient
  module Account
    module Contact
      include PlentyClient::Endpoint
      include PlentyClient::Request

      LIST_A_CONTACTS   = '/accounts/contacts'
      FIND_A_CONTACT    = '/accounts/contacts/{contactId}'
      CREATE_A_CONTACT  = '/accounts/contacts'
      UPDATE_A_CONTACT  = '/accounts/contacts/{contactId}'
      DELETE_A_CONTACT  = '/accounts/contacts/{contactId}'

      class << self
        def list(headers = {}, &block)
          get(build_endpoint(LIST_A_CONTACTS), headers, &block)
        end

        def find(contact_id, headers = {}, &block)
          get(build_endpoint(FIND_A_CONTACT, contact: contact_id), headers, &block)
        end

        def create(body = {})
          post(CREATE_A_CONTACT, body)
        end

        def update(contact_id, body = {})
          put(build_endpoint(UPDATE_A_CONTACT, contact: contact_id), body)
        end

        def destroy(contact_id, body = {})
          delete(build_endpoint(DELETE_A_CONTACT, contact: contact_id), body)
        end
      end
    end
  end
end
