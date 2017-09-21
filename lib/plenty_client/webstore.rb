module PlentyClient
  module Webstore
    include PlentyClient::Endpoint
    include PlentyClient::Request

    LIST_WEBSTORES = '/webstores'.freeze

    class << self
      def list(headers = {}, &block)
        get(build_endpoint(LIST_WEBSTORES), headers, &block)
      end
    end
  end
end
