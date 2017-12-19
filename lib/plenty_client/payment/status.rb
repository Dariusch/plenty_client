# frozen_string_literal: true

module PlentyClient
  module Payment
    class Status
      include PlentyClient::Endpoint
      include PlentyClient::Request

      FIND_PAYMENT_STATUS = '/payments/status/{statusId}'

      class << self
        def find(status_id, headers = {}, &block)
          get(build_endpoint(FIND_PAYMENT_STATUS, status: status_id), headers, &block)
        end
      end
    end
  end
end
