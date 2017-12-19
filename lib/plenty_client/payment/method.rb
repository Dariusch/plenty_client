# frozen_string_literal: true

module PlentyClient
  module Payment
    module Method
      include PlentyClient::Endpoint
      include PlentyClient::Request

      LIST_PAYMENT_METHODS          = '/payments/methods'
      FIND_PAYMENT_METHOD           = '/payments/methods/{paymentMethodId}'
      FIND_PLUGIN_PAYMENT_METHOD    = '/payments/methods/{pluginKey}'
      CREATE_PAYMENT_METHOD         = '/payments/methods'
      UPDATE_PAYMENT_METHOD         = '/payments/methods'
      UPDATE_PAYMENT_METHOD_WITH_ID = '/payments/methods/{pluginKey}'
      LIST_PAYMENT_EBICS_ACCOUNTS   = '/payments/methods/ebics'
      CREATE_PAYMENT_EBICS_ACCOUNT  = '/payments/methods/ebics'

      class << self
        def list(headers = {}, &block)
          get(build_endpoint(LIST_PAYMENT_METHODS), headers, &block)
        end

        def find(method_id, headers = {}, &block)
          get(build_endpoint(FIND_PAYMENT_METHOD, payment_method: method_id), headers, &block)
        end

        def find_by_plugin_key(plugin_key, headers = {}, &block)
          get(build_endpoint(FIND_PLUGIN_PAYMENT_METHOD, plugin_key: plugin_key), headers, &block)
        end

        def create(body = {})
          post(build_endpoint(CREATE_PAYMENT_METHOD), body)
        end

        def update(body = {})
          put(build_endpoint(UPDATE_PAYMENT_METHOD), body)
        end

        # def update(plugin_key, body = {})
        #   put(build_endpoint(UPDATE_PAYMENT_METHOD_WITH_ID, plugin_key: plugin_key), body)
        # end

        def list_ebics_accounts(headers = {}, &block)
          get(build_endpoint(LIST_PAYMENT_EBICS_ACCOUNTS), headers, &block)
        end

        def create_ebics_account(body = {})
          post(build_endpoint(CREATE_PAYMENT_EBICS_ACCOUNT), body)
        end
      end
    end
  end
end
