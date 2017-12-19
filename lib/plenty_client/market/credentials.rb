# frozen_string_literal: true

module PlentyClient
  module Market
    module Credentials
      include PlentyClient::Endpoint
      include PlentyClient::Request

      LIST_MARKET_CREDENTIALS   = '/markets/credentials'
      FIND_MARKET_CREDENTIALS   = '/markets/credentials/{credentialsId}'
      CREATE_MARKET_CREDENTIALS = '/markets/credentials'
      UPDATE_MARKET_CREDENTIALS = '/markets/credentials/{credentialsId}'
      DELETE_MARKET_CREDENTIALS = '/markets/credentials/{credentialsId}'

      class << self
        def list(headers = {}, &block)
          get(build_endpoint(LIST_MARKET_CREDENTIALS), headers, &block)
        end

        def find(credentials_id, headers = {}, &block)
          get(build_endpoint(FIND_MARKET_CREDENTIALS, credentials: credentials_id), headers, &block)
        end

        def create(body = {})
          post(build_endpoint(CREATE_MARKET_CREDENTIALS), body)
        end

        def update(credentials_id, body = {})
          put(build_endpoint(UPDATE_MARKET_CREDENTIALS, credentials: credentials_id), body)
        end

        def destroy(credentials_id, body = {})
          delete(build_endpoint(DELETE_MARKET_CREDENTIALS, credentials: credentials_id), body)
        end
      end
    end
  end
end
