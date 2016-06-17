module Smug
  module Admin
    class HomepagesController < CrudController
      class << self
        def index_attrs
          %w{ name slug updated_at created_at }
        end

        def edit_attrs
          %w{ name slug how_it_works nutrition_summary nutrition_details
              training_summary training_details support_summary
              support_details motivation_summary motivation_details
              education_summary education_details basic_package_overview
              standard_package_overview premium_package_overview
              about_heading about }
        end

        def input_mappings
          {
            basic_package_overview: :wysihtml5,
            standard_package_overview: :wysihtml5,
            premium_package_overview: :wysihtml5
          }.with_indifferent_access
        end
      end

      private

      def find_item
        @item = Homepage.friendly.find(params[:id])
        @item = Smug::Admin::ShowDecorator.decorate(@item)
      end

      def item_params
        params[:homepage][:type] = "Homepage"
        params[:homepage].delete(:slug) if params[:homepage][:slug].blank?
        super
      end
    end
  end
end
