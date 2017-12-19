# frozen_string_literal: true

module PlentyClient
  module Listing
    class OptionTemplate
      include PlentyClient::Endpoint
      include PlentyClient::Request

      PREVIEW_LISTINGS_OPTION_TEMPLATE  = '/listings/option_templates/preview'
      FIND_LISTINGS_OPTION_TEMPLATE     = '/listings/option_templates/{optionTemplateId}'
      CREATE_LISTINGS_OPTION_TEMPLATE   = '/listings/option_templates'
      UPDATE_LISTINGS_OPTION_TEMPLATE   = '/listings/option_templates/{optionTemplateId}'
      DELTE_LISTINGS_OPTION_TEMPLATE    = '/listings/option_templates/{optionTemplateId}'

      class << self
        def preview(headers = {}, &block)
          get(build_endpoint(PREVIEW_LISTINGS_OPTION_TEMPLATE), headers, &block)
        end

        def find(option_template_id, headers = {}, &block)
          get(build_endpoint(FIND_LISTINGS_OPTION_TEMPLATE, option_template: option_template_id), headers, &block)
        end

        def create(body = {})
          post(build_endpoint(CREATE_LISTINGS_OPTION_TEMPLATE), body)
        end

        def update(option_template_id, body = {})
          put(build_endpoint(UPDATE_LISTINGS_OPTION_TEMPLATE, option_template: option_template_id), body)
        end

        def destroy(option_template_id, body = {})
          delete(build_endpoint(DELTE_LISTINGS_OPTION_TEMPLATE, option_template: option_template_id), body)
        end
      end
    end
  end
end
