module PlentyClient
  module Listing
    class LayoutTemplate
      include PlentyClient::Endpoint
      include PlentyClient::Request

      FIND_LISTINGS_LAYOUT_TEMPLATE   = '/listings/layout_templates/{layoutTemplateId}'.freeze
      CREATE_LISTINGS_LAYOUT_TEMPLATE = '/listings/layout_templates'.freeze
      DELTE_LISTINGS_LAYOUT_TEMPLATE  = '/listings/layout_templates/{layoutTemplateId}'.freeze

      class << self
        def find(layout_template_id, headers = {}, &block)
          get(build_endpoint(FIND_LISTINGS_LAYOUT_TEMPLATE, layout_template: layout_template_id), headers, &block)
        end

        def create(body = {})
          post(build_endpoint(CREATE_LISTINGS_LAYOUT_TEMPLATE), body)
        end

        def destroy(layout_template_id, body = {})
          delete(build_endpoint(DELTE_LISTINGS_LAYOUT_TEMPLATE, layout_template: layout_template_id), body)
        end
      end
    end
  end
end
