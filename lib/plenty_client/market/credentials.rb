module PlentyClient
  module Market
    module Credentials
      include PlentyClient::Endpoint
      include PlentyClient::Request

      LIST_MARKET_CREDENTIALS   = '/markets/credentials'.freeze
      FIND_MARKET_CREDENTIALS   = '/markets/credentials/{credentialsId}'.freeze
      CREATE_MARKET_CREDENTIALS = '/markets/credentials'.freeze
      UPDATE_MARKET_CREDENTIALS = '/markets/credentials/{credentialsId}'.freeze
      DELETE_MARKET_CREDENTIALS = '/markets/credentials/{credentialsId}'.freeze

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
