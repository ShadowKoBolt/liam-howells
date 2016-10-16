# frozen_string_literal: true
module Smug
  module Admin
    class BlogPostsController < CrudController
      class << self
        def input_mappings
          {
            content: :wysihtml5,
            image: :attachment,
            tag_list: :string
          }.with_indifferent_access
        end

        def edit_attrs
          %w{name slug content date tag_list image}
        end

        def index_attrs
          %w{name date}
        end

        def nested_associations
          []
        end
      end

      private

      def item_params
        params[:blog_post].delete(:slug) if params[:blog_post][:slug].blank?
        super
      end
    end
  end
end
