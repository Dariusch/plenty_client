module PlentyClient
  module Order
    module Item
      class Date
        include PlentyClient::Endpoint
        include PlentyClient::Request

        # get /orders/items/{orderItemId}/dates
        # get /orders/items/{orderItemId}/dates/{typeId}
        # post /orders/items/{orderItemId}/dates/{typeId}
        # put /orders/items/{orderItemId}/dates/{typeId}
        # delete /orders/items/{orderItemId}/dates/{typeId}
        # get /orders/items/dates/{orderDateId}
        # post /orders/items/dates
        # put /orders/items/dates/{orderDateId}
        # delete /orders/items/dates/{orderDateId}
      end
    end
  end
end
