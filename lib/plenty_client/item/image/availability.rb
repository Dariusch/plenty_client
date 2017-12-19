# frozen_string_literal: true

module PlentyClient
  module Item
    module Image
      class Availability
        include PlentyClient::Endpoint
        include PlentyClient::Request

        ITEM_IMAGE_AVAILABILITY_PATH    = '/items/{itemId}/images'

        LIST_ITEM_IMAGE_AVAILABILITY    = '/{imageId}/availabilities'
        CREATE_ITEM_IMAGE_AVAILABILITY  = '/{imageId}/availabilities'
        DELETE_ITEMS_IMAGE_AVAILABILITY = '/{imageId}/availabilities'

        class << self
          def create(item_id, image_id, headers = {})
            post(build_endpoint("#{ITEM_IMAGE_AVAILABILITY_PATH}#{CREATE_ITEM_IMAGE_AVAILABILITY}",
                                item: item_id,
                                image: image_id), headers)
          end

          def list(item_id, image_id, headers = {}, &block)
            get(build_endpoint("#{ITEM_IMAGE_AVAILABILITY_PATH}#{LIST_ITEM_IMAGE_AVAILABILITY}",
                               item: item_id,
                               image: image_id),
                headers, &block)
          end

          def destroy(item_id, image_id)
            delete(build_endpoint("#{ITEM_IMAGE_AVAILABILITY_PATH}#{DELETE_ITEMS_IMAGE_AVAILABILITY}",
                                  item: item_id,
                                  image: image_id))
          end
        end
      end
    end
  end
end
