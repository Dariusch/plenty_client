# frozen_string_literal: true

module PlentyClient
  module ItemSet
    class Component
      include PlentyClient::Endpoint
      include PlentyClient::Request

      LIST_ITEM_SET_COMPONENT     = '/item_sets/{itemSetId}/components/{componentId}'
      LIST_ITEM_SETS_COMPONENT    = '/item_sets/{itemSetId}/components'
      CREATE_ITEM_SET_COMPONENTS  = '/item_sets/{itemSetId}/components'
      UPDATE_ITEM_SET_COMPONENT   = '/item_sets/{itemSetId}/components/{componentId}'
      UPDATE_ITEM_SETS_COMPONENTS = '/item_sets/{itemSetId}/components'
      DELETE_ITEM_SET_COMPONENT   = '/item_sets/{itemSetId}/components/{componentId}'
      DELETE_ITEM_SETS_COMPONENTS = '/item_sets/{itemSetId}/components'

      class << self
        def list_item_set_component(item_set_id, component_id, headers = {}, &block)
          get(build_endpoint(LIST_ITEM_SET_COMPONENT, item_set: item_set_id, component: component_id),
              headers, &block)
        end

        def list_item_sets_components(item_set_id, headers = {}, &block)
          get(build_endpoint(LIST_ITEM_SETS_COMPONENT, item_set: item_set_id), headers, &block)
        end

        def create(item_set_id, body = {})
          post(build_endpoint(CREATE_ITEM_SET_COMPONENTS, item_set: item_set_id), body)
        end

        def update_item_set_component(item_set_id, component_id, body = {})
          put(build_endpoint(UPDATE_ITEM_SET_COMPONENT, item_set: item_set_id, component: component_id), body)
        end

        def update_item_sets_components(item_set_id, body = {})
          put(build_endpoint(UPDATE_ITEM_SETS_COMPONENTS, item_set: item_set_id), body)
        end

        def destroy_item_set_component(item_set_id, component_id, body = {})
          delete(build_endpoint(DELETE_ITEM_SET_COMPONENT, item_set: item_set_id, component: component_id), body)
        end

        def destroy_item_sets_components(item_set_id, body = {})
          delete(build_endpoint(DELETE_ITEM_SETS_COMPONENTS, item_set: item_set_id), body)
        end
      end
    end
  end
end
