# frozen_string_literal: true

module PlentyClient
  module Basket
    class Item
      include PlentyClient::Endpoint
      include PlentyClient::Request

      CREATE_BASKET_ITEM  = '/basket/items'
      LIST_BASKET_ITEMS   = '/basket/items'

      class << self
        def list(headers = {}, &block)
          get(LIST_BASKET_ITEMS, headers, &block)
        end

        def create(body = {})
          post(CREATE_BASKET_ITEM, body)
        end
      end
    end
  end
end
