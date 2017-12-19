# frozen_string_literal: true

module PlentyClient
  module Webstore
    include PlentyClient::Endpoint
    include PlentyClient::Request

    LIST_WEBSTORES = '/webstores'

    class << self
      def list(headers = {}, &block)
        get(build_endpoint(LIST_WEBSTORES), headers, &block)
      end
    end
  end
end
