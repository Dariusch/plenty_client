# frozen_string_literal: true

module PlentyClient
  module Payment
    module MethodName
      include PlentyClient::Endpoint
      include PlentyClient::Request

      LIST_METHOD_NAMES                             = '/payments/methodNames'
      LIST_METHOD_NAMES_FOR_PAYMENT_METHOD          = '/payments/methodNames/{paymentMethodId}'
      FIND_METHOD_NAMES_FOR_PAYMENT_METHOD_BY_LANG  = '/payments/methodNames/{paymentMethodId}/{land}'

      class << self
        def list(headers = {}, &block)
          get(build_endpoint(LIST_METHOD_NAMES), headers, &block)
        end

        def list_for_payment_method(payment_method_id, headers = {}, &block)
          get(build_endpoint(LIST_METHOD_NAMES, payment_method: payment_method_id), headers, &block)
        end

        def list_for_payment_method_by_lang(payment_method_id, lang, headers = {}, &block)
          get(build_endpoint(LIST_METHOD_NAMES_FOR_PAYMENT_METHOD,
                             payment_method: payment_method_id,
                             lang: lang),
              headers, &block)
        end
      end
    end
  end
end
