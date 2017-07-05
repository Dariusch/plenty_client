module PlentyClient
  module Order
    module Item
      class Property
        include PlentyClient::Endpoint
        include PlentyClient::Request

        # get /orders/items/{orderItemId}/properties
        # get /orders/items/{orderItemId}/properties/{typeId}
        # post /orders/items/{orderItemId}/properties/{typeId}
        # put /orders/items/{orderItemId}/properties/{typeId}
        # delete /orders/items/{orderItemId}/properties/{typeId}
        # get /rest/orders/items/properties/{id}
        # post /rest/orders/items/properties
        # put /rest/orders/items/properties/{id}
        # delete /rest/orders/items/properties/{id}
      end
    end
  end
end
