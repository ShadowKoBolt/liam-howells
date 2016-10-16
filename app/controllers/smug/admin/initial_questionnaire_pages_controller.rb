# frozen_string_literal: true
module Smug
  module Admin
    class InitialQuestionnairePagesController < CrudController
      class << self
        def index_attrs
          %w{name slug updated_at created_at}
        end

        def edit_attrs
          %w{name slug intro_content left_content}
        end

        def input_mappings
          {
            intro_content: :wysihtml5,
            left_content: :wysihtml5,
          }.with_indifferent_access
        end

        def display_in_nav?
          false
        end
      end

      private

      def find_item
        @item = InitialQuestionnairePage.friendly.find(params[:id])
        @item = Smug::Admin::ShowDecorator.decorate(@item)
      end

      def item_params
        params[:initial_questionnaire_page][:type] = "InitialQuestionnairePage"
        params[:initial_questionnaire_page].delete(:slug) if params[:initial_questionnaire_page][:slug].blank?
        super
      end
    end
  end
end
