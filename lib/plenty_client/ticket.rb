module PlentyClient
  module Ticket
    include PlentyClient::Endpoint
    include PlentyClient::Request

    LIST_TICKETS  = '/tickets'.freeze
    CREATE_TICKET = '/tickets'.freeze
    ADD_MESSAGE   = '/tickets/{ticketId}'.freeze
    GET_TICKET    = '/tickets/{ticketId}'.freeze

    class << self
      def list(headers = {}, &block)
        get(build_endpoint(LIST_TICKETS), headers, &block)
      end

      def create(body = {})
        post(build_endpoint(CREATE_TICKET), body)
      end

      def add_message(ticket_id, body = {})
        post(build_endpoint(ADD_MESSAGE, ticket: ticket_id), body)
      end

      def update(ticket_id, body = {})
        put(build_endpoint(UPDATE_TICKET, ticket: ticket_id), body)
      end
    end
  end
end
