# frozen_string_literal: true

module PlentyClient
  module Item
    module Variation
      class Image
        include PlentyClient::Endpoint
        include PlentyClient::Request

        ITEM_IMAGE_BASE_PATH        = '/items/{itemId}'

        LIST_IMAGES_IMAGE_LINKS     = '/images/{imageId}/variation_images'
        LIST_VARIATION_IMAGE_LINKS  = '/variations/{variationId}/variation_images'
        GET_ITEM_IMAGES             = '/variation_images'
        UPDATE_ITEM_IMAGES          = '/variations/{variationId}/variation_images'
        DELETE_ITEM_IMAGES          = '/variations/{variationId}/variation_images/{imageId}'

        class << self
          def list_images_image_links(item_id, image_id, headers = {}, &block)
            get(build_endpoint("#{ITEM_IMAGE_BASE_PATH}#{LIST_IMAGES_IMAGE_LINKS}",
                               item: item_id,
                               image: image_id), headers, &block)
          end

          def list_variations_image_links(item_id, variation_id, headers = {}, &block)
            get(build_endpoint("#{ITEM_IMAGE_BASE_PATH}#{LIST_VARIATION_IMAGE_LINKS}",
                               item: item_id,
                               variation: variation_id), headers, &block)
          end

          def list_items_image_links(item_id, headers = {}, &block)
            get(build_endpoint("#{ITEM_IMAGE_BASE_PATH}#{GET_ITEM_IMAGES}",
                               item: item_id), headers, &block)
          end

          def create(item_id, variation_id, body = {})
            post(build_endpoint("#{ITEM_IMAGE_BASE_PATH}#{UPDATE_ITEM_IMAGES}",
                                item: item_id,
                                variation: variation_id), body)
          end

          def destroy(item_id, variation_id, image_id)
            delete(build_endpoint("#{ITEM_IMAGE_BASE_PATH}#{DELETE_ITEM_IMAGES}",
                                  item: item_id,
                                  variation: variation_id,
                                  image: image_id))
          end
        end
      end
    end
  end
end
