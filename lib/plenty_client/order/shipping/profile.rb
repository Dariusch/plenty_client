module PlentyClient
  module Order
    module Shipping
      class Profile
        include PlentyClient::Endpoint
        include PlentyClient::Request

        LIST_SHIPPING_PRESET  = '/orders/shipping/presets'.freeze
        FIND_SHIPPING_PRESETS = '/orders/shipping/presets/{presetId}'.freeze

        class << self
          def list(headers = {}, &block)
            get(build_endpoint(LIST_SHIPPING_PRESET), headers, &block)
          end

          def find(preset_id, headers = {}, &block)
            get(build_endpoint(FIND_SHIPPING_PRESETS, preset: preset_id), headers, &block)
          end
        end
      end
    end
  end
end
