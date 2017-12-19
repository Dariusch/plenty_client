# frozen_string_literal: true

module PlentyClient
  module Order
    class Referrer
      include PlentyClient::Endpoint
      include PlentyClient::Request

      LIST_REFERRERS        = '/orders/referrers'
      CREATE_ORDER_REFERRER = '/orders/referrers/{parentReferrerId}'

      class << self
        def list(headers = {})
          get(build_endpoint(LIST_REFERRERS), headers)
        end

        def create(parent_referrer_id, body = {})
          post(build_endpoint(CREATE_ORDER_REFERRER, parent_referrer: parent_referrer_id), body)
        end
      end
    end
  end
end
