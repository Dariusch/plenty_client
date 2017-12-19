# frozen_string_literal: true

module PlentyClient
  module Listing
    class ShippingProfile
      include PlentyClient::Endpoint
      include PlentyClient::Request

      FIND_LISTINGS_SHIPPING_PROFILE   = '/listings/shipping_profiles/{shippingProfileId}'
      LIST_LISTINGS_SHIPPING_PROFILES  = '/listings/shipping_profiles'

      class << self
        def find(shipping_profile_id, headers = {}, &block)
          get(build_endpoint(FIND_LISTINGS_SHIPPING_PROFILE, shipping_profile: shipping_profile_id), headers, &block)
        end

        def list(headers = {}, &block)
          get(build_endpoint(LIST_LISTINGS_SHIPPING_PROFILES), headers, &block)
        end
      end
    end
  end
end
