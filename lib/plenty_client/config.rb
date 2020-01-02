module PlentyClient
  class Config
    class NoCredentials < StandardError; end
    class NoToken < StandardError; end
    class NoPlentyId < StandardError; end
    class InvalidCredentials < StandardError; end

    # When expiry_date is less than this many seconds from now, it should renew API keys
    LOGIN_RENEW_BUFFER = 60
    ATTEMPT_COUNT = 3

    class << self
      attr_accessor :site_url, :api_user, :api_password, :access_token, :refresh_token, :log, :expiry_date, :plenty_id
      attr_accessor :request_wait_until
      attr_writer :attempt_count

      def validate_credentials
        raise NoCredentials if site_url.nil? || api_user.nil? || api_password.nil?
      end

      def tokens_present?
        !access_token.nil? && !refresh_token.nil?
      end

      def attempt_count
        @attempt_count || ATTEMPT_COUNT
      end

      def tokens_valid?
        tokens_present? &&
          expiry_date.instance_of?(Time) &&
          expiry_date > Time.now &&
          (expiry_date - Time.now > LOGIN_RENEW_BUFFER)
      end
    end
  end
end
