module PlentyClient
  module Payment
    include PlentyClient::Endpoint
    include PlentyClient::Request

    LIST_PAYMENTS       = '/payments'.freeze
    FIND_PAYMENT        = '/payments/{paymentId}'.freeze
    CREATE_PAYMENT      = '/payments'.freeze
    UPDATE_PAYMENT      = '/payments/{paymentId}'.freeze
    PAYMENT_ENTRYDATE   = '/payments/entrydate'.freeze
    PAYMENT_IMPORTDATE  = '/payments/importdate'.freeze

    class << self
      def list(headers = {}, &block)
        get(build_endpoint(LIST_PAYMENT), headers, &block)
      end

      def find(payment_id, headers = {}, &block)
        get(build_endpoint(FIND_PAYMENT, payment: payment_id), headers, &block)
      end

      def update(payment_id, body = {})
        put(build_endpoint(FIND_PAYMENT, payment: payment_id), body)
      end

      def list_by_entry_date(headers = {}, &block)
        get(build_endpoint(PAYMENT_ENTRYDATE), headers, &block)
      end

      def list_by_import_date(headers = {}, &block)
        get(build_endpoint(PAYMENT_IMPORTDATE), headers, &block)
      end
    end
  end
end
