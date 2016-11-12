# frozen_string_literal: true
module Smug
  module Admin
    class PackagesController < CrudController
      class << self
        def edit_attrs
          %w{name description price_f position}
        end

        def index_attrs
          %w{name price_f}
        end
      end
    end
  end
end
