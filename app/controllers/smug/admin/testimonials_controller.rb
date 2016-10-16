# frozen_string_literal: true
module Smug
  module Admin
    class TestimonialsController < CrudController
      class << self
        def input_mappings
          {
            content: :text,
            image: :attachment
          }.with_indifferent_access
        end

        def edit_attrs
          %w{author content position show_on_home image}
        end

        def index_attrs
          %w{author content show_on_home}
        end
      end
    end
  end
end
