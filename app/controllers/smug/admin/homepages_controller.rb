module Smug
  module Admin
    class HomepagesController < CrudController
      class << self
        def index_attrs
          %w{ name slug updated_at created_at }
        end

        def edit_attrs
          %w{ name slug how_it_works }
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
