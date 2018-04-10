# frozen_string_literal: true

module PlentyClient
  module Concerns
    module SinglePaths
      def create(headers = {}, &block)
        post(base_path, headers, &block)
      end

      def find(id, headers = {}, &block)
        get(single_path(id), headers, &block)
      end

      def update(id, headers = {}, &block)
        put(single_path(id), headers, &block)
      end

      def destroy(id, headers = {}, &block)
        delete(single_path(id), headers, &block)
      end

      private

      def base_path
        ''
      end

      def single_path(id)
        base_path + "/#{id}"
      end
    end
  end
end
