module Smug
  module Admin
    class TestimonialsController < CrudController
      class << self
        def input_mappings
          {
            content: :text
          }.with_indifferent_access
        end
      end
    end
  end
end
