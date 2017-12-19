# frozen_string_literal: true

module PlentyClient
  module Account
    class Address
      include PlentyClient::Endpoint
      include PlentyClient::Request

      ACCOUNT_ADDRESS_BASE_PATH = '/accounts/addresses'
      SINGLE_ADDRESS_SUFFIX     = '/{addressId}'

      class << self
        def find(address_id, headers = {})
          get(url(address_id), headers)
        end

        def create(headers = {})
          post(build_endpoint(ACCOUNT_ADDRESS_BASE_PATH), headers)
        end

        def update(address_id, headers = {})
          put(url(address_id), headers)
        end

        def destroy(address_id, headers = {})
          delete(url(address_id), headers)
        end

        private

        def url(address_id)
          build_endpoint(ACCOUNT_ADDRESS_BASE_PATH + SINGLE_ADDRESS_SUFFIX, address: address_id)
        end
      end
    end
  end
end
