module PlentyClient
  module Item
    class ShippingProfile
      include PlentyClient::Endpoint
      include PlentyClient::Request

      GET_ITEMS_SHIPPING_PROFILE    = '/items/{itemId}/item_shipping_profiles'.freeze
      CREATE_ITEMS_SHIPPING_PROFILE = '/items/{itemId}/item_shipping_profiles'.freeze
      DELETE_ITEMS_SHIPPING_PROFILE = '/items/{itemId}/item_shipping_profiles/{shippingProfileId}'.freeze

      class << self
        def list(item_id, headers = {}, &block)
          get(build_endpoint(GET_ITEMS_SHIPPING_PROFILE, item: item_id), headers, &block)
        end

        def create(item_id, headers = {})
          post(build_endpoint(CREATE_ITEMS_SHIPPING_PROFILE, item: item_id), headers)
        end

        def delete(item_id, profile_id)
          delete(build_endpoint(DELETE_ITEMS_SHIPPING_PROFILE, item: item_id, profile: profile_id))
        end
      end
    end
  end
end
