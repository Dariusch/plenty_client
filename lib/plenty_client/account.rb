# frozen_string_literal: true

module PlentyClient
  module Account
    include PlentyClient::Endpoint
    include PlentyClient::Request

    LIST_ACCOUNTS           = '/accounts'
    FIND_ACCOUNT            = '/accounts/{accountId}'
    CREATE_ACCOUNT          = '/accounts'
    UPDATE_ACCOUNT          = '/accounts/{accountId}'
    DELETE_ACCOUNT          = '/accounts/{accountId}'
    LIST_ACCOUNTS_CONTACTS  = '/accounts/{accountId}/contacts'

    ACCOUNT_LOGIN   = '/account/login'
    ACCOUNT_REFRESH = '/account/login/refresh'
    ACCOUNT_LOGOUT  = '/account/logout'

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
