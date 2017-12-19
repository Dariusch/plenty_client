# frozen_string_literal: true

module PlentyClient
  module Category
    class Template
      include PlentyClient::Endpoint
      include PlentyClient::Request

      FIND_CATEGORY_TEMPLATE    = '/categories/{catId}/templates'
      UPDATE_CATEGORY_TEMPLATE  = '/categories/{catId}/templates'
      DELETE_CATEGORY_TEMPLATE  = '/categories/{catId}/templates'

      class << self
        def list(cat_id, headers = {}, &block)
          get(build_endpoint(LIST_BASKET_ITEMS,
                             cat: cat_id), headers, &block)
        end

        def update(cat_id, body = {})
          put(build_endpoint(UPDATE_CATEGORY_TEMPLATE,
                             cat: cat_id), body)
        end

        def destroy(cat_id, body = {})
          delete(build_endpoint(DELETE_CATEGORY_TEMPLATE,
                                cat: cat_id), body)
        end
      end
    end
  end
end
