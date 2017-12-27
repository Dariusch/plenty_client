# frozen_string_literal: true

module PlentyClient
  module Category
    include PlentyClient::Endpoint
    include PlentyClient::Request

    FIND_CATEGORY           = '/categories/{catId}'
    LIST_CATEGORIES         = '/categories'
    CREATE_CATEGORY         = '/categories'
    UPDATE_CATEGORY         = '/categories/{catId}'
    UPDATE_CATEGORIES       = '/categories'
    DELETE_CATEGORY         = '/categories/{catId}'
    DELETE_CATEGORY_DETAILS = '/categories/{catId}/details'
    DELETE_CATEGORY_CLIENTS = '/categories/{catId}/clients'

    class << self
      def list(headers = {}, &block)
        get(build_endpoint(LIST_CATEGORIES), headers, &block)
      end

      def find(cat_id = nil, headers = {}, &block)
        get(build_endpoint(FIND_CATEGORY, cat: cat_id), headers, &block)
      end

      def create(body = {})
        post(CREATE_CATEGORY, body)
      end

      def update(cat_id, body = {})
        put(build_endpoint(UPDATE_CATEGORY, cat: cat_id), body)
      end

      def update_all(body = {})
        put(build_endpoint(UPDATE_CATEGORIES), body)
      end

      def destroy(cat_id, body = {})
        delete(build_endpoint(DELETE_CATEGORY, cat: cat_id), body)
      end

      def destroy_details(cat_id, body = {})
        delete(build_endpoint(DELETE_CATEGORY_DETAILS, cat: cat_id), body)
      end

      def destroy_clients(cat_id, body = {})
        delete(build_endpoint(DELETE_CATEGORY_CLIENTS, cat: cat_id), body)
      end
    end
  end
end
