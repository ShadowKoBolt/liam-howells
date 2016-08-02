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
          %w{ name content date tag_list image  }
        end

        def index_attrs
          %w{ name date }
        end

        def nested_associations
          []
        end
      end
    end
  end
end
