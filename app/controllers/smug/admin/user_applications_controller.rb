# frozen_string_literal: true
module Smug
  module Admin
    class UserApplicationsController < CrudController
      class << self
        def index_attrs
          %w{name created_at}
        end

        def item_actions
          [:edit, :update, :index, :destroy, :show]
        end

        def show_attrs
          rejects = %w{id uuid initial_questionnaire_attributes}
          super.reject { |k, _v| k.in?(rejects) }
        end
      end

      def find_item
        @item = UserApplication.find_by_uuid(params[:id])
        @item = ShowDecorator.decorate(@item)
      end
    end
  end
end
