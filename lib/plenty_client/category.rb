module PlentyClient
  module Category
    extend PlentyClient::Endpoint
    extend PlentyClient::Request

    FIND_CATEGORY           = '/categories/{catId}'.freeze
    LIST_CATEGORIES         = '/categories'.freeze
    CREATE_CATEGORY         = '/categories'.freeze
    UPDATE_CATEGORY         = '/categories/{catId}'.freeze
    UPDATE_CATEGORIES       = '/categories'.freeze
    DELETE_CATEGORY         = '/categories/{catId}'.freeze
    DELETE_CATEGORY_DETAILS = '/categories/{catId}/details'.freeze
    DELETE_CATEGORY_CLIENTS = '/categories/{catId}/clients'.freeze

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
        post(build_endpoint(UPDATE_CATEGORY,
                            cat: cat_id), body)
      end

      def update_all(body = {})
        post(build_endpoint(UPDATE_CATEGORIES), body)
      end

      def delete(cat_id, body = {})
        delete(build_endpoint(DELETE_CATEGORY, cat: cat_id), body)
      end

      def delete_details(cat_id, body = {})
        delete(build_endpoint(DELETE_CATEGORY_DETAILS, cat: cat_id), body)
      end

      def delete_clients(cat_id, body = {})
        delete(build_endpoint(DELETE_CATEGORY_CLIENTS, cat: cat_id), body)
      end
    end
  end
end
