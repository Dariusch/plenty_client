# frozen_string_literal: true

module PlentyClient
  module OrderSummary
    include PlentyClient::Endpoint
    include PlentyClient::Request

    LIST_ORDER_SUMMARYS           = '/order_summaries'
    CREATE_ORDER_SUMMARY          = '/order_summaries'
    FIND_ORDER_SUMMARY            = '/order_summaries/{orderSummaryId}'
    FIND_ORDER_SUMMARY_BY_CONTACT = '/order_summaries/contacts/{contactId}'
    FIND_ORDER_SUMMARY_BY_ADDRESS = '/order_summaries/orders/{addressId}'
    UPDATE_ORDER_SUMMARY          = '/order_summaries/{orderSummaryId}'
    DELETE_ORDER_SUMMARY          = '/order_summaries/{orderSummaryId}'

    class << self
      def create(body = {})
        post(build_endpoint(CREATE_ORDER_SUMMARY), body)
      end

      def list(headers = {}, &block)
        get(build_endpoint(LIST_ORDER_SUMMARYS), headers, &block)
      end

      def find(order_summary_id, headers = {}, &block)
        get(build_endpoint(FIND_ORDER_SUMMARY, order_summary: order_summary_id), headers, &block)
      end

      def find_by_contact(contact_id, headers = {}, &block)
        get(build_endpoint(FIND_ORDER_SUMMARY_BY_CONTACT, contact: contact_id), headers, &block)
      end

      def find_by_address(address_id, headers = {}, &block)
        get(build_endpoint(LIST_ORDER_SUMMARYS_PACKAGE_NUMBERS, address: address_id), headers, &block)
      end

      def update(order_summary_id, body = {})
        put(build_endpoint(UPDATE_ORDER_SUMMARY, order_summary: order_summary_id), body)
      end

      def destroy(order_summary_id, body = {})
        delete(build_endpoint(DELETE_ORDER_SUMMARY, order_summary: order_summary_id), body)
      end
    end
  end
end
