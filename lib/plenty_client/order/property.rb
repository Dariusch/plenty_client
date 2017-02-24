module PlentyClient
  module Order
    class Property
      extend PlentyClient::Endpoint
      extend PlentyClient::Request

      # get /rest/orders/{orderId}/properties/{typeId?}
      # post /rest/orders/{orderId}/properties
      # put /rest/orders/{orderId}/properties/{typeId}
      # put /rest/orders/properties/{id}
      # delete /rest/orders/properties/{id}
      # delete /rest/orders/{orderId}/properties/{typeId}
      # get /rest/orders/properties/types
      # get /rest/orders/properties/types/{typeId}
      # post /rest/orders/properties/types
      # put /rest/orders/properties/types/{typeId}
      # delete /rest/orders/properties/types/{typeId}
    end
  end
end

