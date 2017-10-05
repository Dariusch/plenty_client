module PlentyClient
  class Config
    class NoCredentials < StandardError; end
    class NoToken < StandardError; end
    class NoPlentyId < StandardError; end

    class << self
      attr_accessor :site_url, :api_user, :api_password, :access_token, :refresh_token, :log, :expiry_date, :plenty_id

      def validate
        raise NoCredentials if site_url.nil? || api_user.nil? || api_password.nil?
      end

      def validate_tokens
        raise NoToken if access_token.nil? || refresh_token.nil?
        raise NoPlentyId if plenty_id.nil? || plenty_id&.empty?
      end
    end
  end
end
