# frozen_string_literal: true

module PlentyClient
  module Payment
    class Contact
      include PlentyClient::Endpoint
      include PlentyClient::Request

      CREATE_PAYMENT_CONTACT_RELATION = '/payment/{paymentId}/contact/{contactId}'
      DELETE_CONTACTS_PAYMENT         = '/payment/{paymentId}/contact'

      class << self
        def create(payment_id, contact_id, body = {})
          post(build_endpoint(CREATE_PAYMENT_CONTACT_RELATION, payment: payment_id, contact: contact_id), body)
        end

        def destroy(payment_id, body = {})
          delete(build_endpoint(DELETE_CONTACTS_PAYMENT, payment: payment_id), body)
        end
      end
    end
  end
end
