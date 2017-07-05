module PlentyClient
  module Authorization
    include PlentyClient::Endpoint
    include PlentyClient::Request

    AUTH_USER                = '/authorized_user'.freeze
    AUTH_USER_WITH_UI_CONFIG = '/user/authorized_user_with_ui_config'.freeze

    class << self
      def list(headers = {}, &block)
        get(build_endpoint(AUTH_TOKEN), headers, &block)
      end

      def list_with_ui_config(headers = {}, &block)
        get(build_endpoint(AUTH_USER_WITH_UI_CONFIG), headers, &block)
      end
    end
  end
end
