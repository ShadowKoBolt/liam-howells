# frozen_string_literal: true
module Smug
  module Admin
    class ContactInfosController < CrudController
      class << self
        def index_attrs
          %w{introduction updated_at created_at}
        end

        def edit_attrs
          %w{name slug introduction}
        end

        def input_mappings
          {
            introduction: :wysihtml5,
          }.with_indifferent_access
        end

        def display_in_nav?
          false
        end

      end

      private

      def find_item
        @item = ContactInfo.friendly.find(params[:id])
        @item = Smug::Admin::ShowDecorator.decorate(@item)
      end

      def item_params
        params[:contact_info][:type] = "ContactInfo"
        params[:contact_info].delete(:slug) if params[:contact_info][:slug].blank?
        super
      end
    end
  end
end
