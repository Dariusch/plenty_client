module PlentyClient
  module Category
    class Branch
      extend PlentyClient::Endpoint
      extend PlentyClient::Request

      FIND_CATEGORY_BRANCH = '/category_branches/{catId}'.freeze
      LIST_CATEGORY_BRANCH = '/category_branches'.freeze

      class << self
        def list(headers = {}, &block)
          get(build_endpoint(LIST_CATEGORY_BRANCH), headers, &block)
        end

        def find(cat_id, headers = {}, &block)
          get(build_endpoint(FIND_CATEGORY_BRANCH,
                             cat: cat_id), headers, &block)
        end
      end
    end
  end
end
