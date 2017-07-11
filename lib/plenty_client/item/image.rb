module PlentyClient
  module Item
    module Image
      include PlentyClient::Endpoint
      include PlentyClient::Request

      ITEM_IMAGE_BASE_PATH        = '/items/{itemId}'.freeze

      LIST_ALL_ITEM_IMAGES      = '/images'.freeze
      CREATE_ITEM_IMAGES        = '/images/upload'.freeze
      GET_ITEM_IMAGES           = '/images/{imageId}'.freeze
      UPDATE_ITEM_IMAGES        = '/images/{imageId}'.freeze
      DELETE_ITEM_IMAGES        = '/images/{imageId}'.freeze
      LIST_ITEM_VARIATION_IMAGE = '/variations/{variationId}/images'.freeze

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
                             property_group: item_id,
                             image: image_id), headers, &block)
        end

        def create(headers = {})
          post(build_endpoint("#{ITEM_IMAGE_BASE_PATH}#{CREATE_ITEM_IMAGES}"), headers)
        end
        self.send(:alias_method, :upload, :create)

        def update(item_id, image_id, headers = {})
          put(build_endpoint("#{ITEM_IMAGE_BASE_PATH}#{UPDATE_ITEM_IMAGES}",
                             property_group: item_id,
                             image: image_id), headers)
        end

        def destroy(item_id, image_id)
          delete(build_endpoint("#{ITEM_IMAGE_BASE_PATH}#{DELETE_ITEM_IMAGES}",
                                property_group: item_id,
                                image: image_id))
        end
      end
    end
  end
end
