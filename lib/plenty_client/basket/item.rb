module PlentyClient
  module Basket
    class Item
      include PlentyClient::Endpoint
      include PlentyClient::Request

      CREATE_BASKET_ITEM  = '/basket/items'.freeze
      LIST_BASKET_ITEMS   = '/basket/items'.freeze

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
