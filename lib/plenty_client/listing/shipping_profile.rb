module PlentyClient
  module Listing
    class ShippingProfile
      include PlentyClient::Endpoint
      include PlentyClient::Request

      FIND_SHIPPING_PROFILE   = '/rest/listings/shipping_profiles/{shippingProfileId}'.freeze
      LIST_SHIPPING_PROFILES  = '/rest/listings/shipping_profiles'.freeze

      class << self
        def find(shipping_profile_id, headers = {}, &block)
          get(build_endpoint(FIND_SHIPPING_PROFILE, shipping_profile: shipping_profile_id), headers, &block)
        end

        def list(headers = {}, &block)
          get(build_endpoint(LIST_SHIPPING_PROFILES), headers, &block)
        end
      end
    end
  end
end
