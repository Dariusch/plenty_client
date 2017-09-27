module PlentyClient
  module Account
    include PlentyClient::Endpoint
    include PlentyClient::Request

    LIST_ACCOUNTS           = '/accounts'.freeze
    FIND_ACCOUNT            = '/accounts/{accountId}'.freeze
    CREATE_ACCOUNT          = '/accounts'.freeze
    UPDATE_ACCOUNT          = '/accounts/{accountId}'.freeze
    DELETE_ACCOUNT          = '/accounts/{accountId}'.freeze
    LIST_ACCOUNTS_CONTACTS  = '/accounts/{accountId}/contacts'.freeze

    ACCOUNT_LOGIN   = '/account/login'.freeze
    ACCOUNT_REFRESH = '/account/login/refresh'.freeze
    ACCOUNT_LOGOUT  = '/account/logout'.freeze

    class << self
      def list(headers = {}, &block)
        get(build_endpoint(LIST_ACCOUNTS), headers, &block)
      end

      def find(account_id, headers = {}, &block)
        get(build_endpoint(FIND_ACCOUNT, account: account_id), headers, &block)
      end

      def create(body = {})
        post(CREATE_ACCOUNT, body)
      end

      def update(account_id, body = {})
        put(build_endpoint(UPDATE_ACCOUNT, account: account_id), body)
      end

      def destroy(account_id, body = {})
        delete(build_endpoint(DELETE_ACCOUNT, account: account_id), body)
      end

      def list_contacts(account_id, headers = {}, &block)
        get(build_endpoint(LIST_ACCOUNTS_CONTACTS, account: account_id), headers, &block)
      end

      def login(body = {})
        post(ACCOUNT_LOGIN, body)
      end

      def refresh_login(body = {})
        post(ACCOUNT_REFRESH, body)
      end

      def logout(body = {})
        post(ACCOUNT_LOGOUT, body)
      end
    end
  end
end
