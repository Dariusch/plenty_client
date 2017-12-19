# frozen_string_literal: true

module PlentyClient
  module Item
    module Image
      include PlentyClient::Endpoint
      include PlentyClient::Request

      ITEM_IMAGE_BASE_PATH      = '/items/{itemId}'

      LIST_ALL_ITEM_IMAGES      = '/images'
      CREATE_ITEM_IMAGES        = '/images/upload'
      GET_ITEM_IMAGES           = '/images/{imageId}'
      UPDATE_ITEM_IMAGES        = '/images/{imageId}'
      DELETE_ITEM_IMAGES        = '/images/{imageId}'
      LIST_ITEM_VARIATION_IMAGE = '/variations/{variationId}/images'

      class << self
        def list(item_id, headers = {}, &block)
          get(build_endpoint("#{ITEM_IMAGE_BASE_PATH}#{LIST_ALL_ITEM_IMAGES}",
                             item: item_id), headers, &block)
        end

        def list_variation_images(item_id, variation_id, headers = {}, &block)
          get(build_endpoint("#{ITEM_IMAGE_BASE_PATH}#{LIST_ITEM_VARIATION_IMAGE}",
                             item: item_id,
                             variation: variation_id), headers, &block)
        end

        def find(item_id, image_id, headers = {}, &block)
          get(build_endpoint("#{ITEM_IMAGE_BASE_PATH}#{GET_ITEM_IMAGES}",
                             item: item_id,
                             image: image_id), headers, &block)
        end

        def create(item_id, headers = {})
          post(build_endpoint("#{ITEM_IMAGE_BASE_PATH}#{CREATE_ITEM_IMAGES}",
                              item: item_id), headers)
        end
        send(:alias_method, :upload, :create)

        def update(item_id, image_id, headers = {})
          put(build_endpoint("#{ITEM_IMAGE_BASE_PATH}#{UPDATE_ITEM_IMAGES}",
                             item: item_id,
                             image: image_id), headers)
        end

        def destroy(item_id, image_id)
          delete(build_endpoint("#{ITEM_IMAGE_BASE_PATH}#{DELETE_ITEM_IMAGES}",
                                item: item_id,
                                image: image_id))
        end
      end
    end
  end
end
