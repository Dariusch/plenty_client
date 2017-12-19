# frozen_string_literal: true

module PlentyClient
  module Payment
    class Transaction
      include PlentyClient::Endpoint
      include PlentyClient::Request

      FIND_PAYMENT_TRANSACTIONS = '/payments/transactions/{transactionTypeId}'

      class << self
        def find(transaction_type_id, headers = {}, &block)
          get(build_endpoint(FIND_PAYMENT_TRANSACTIONS, transaction_type: transaction_type_id), headers, &block)
        end
      end
    end
  end
end
