module Smug
  module Admin
    class InitialQuestionnairesController < CrudController
      class << self
        def index_attrs
          %w{ first_name last_name email created_at }
        end

        def item_actions
          [:edit, :update, :index, :destroy, :show]
        end
      end

      def convert
        find_item
        user_application = UserApplication.new_from_initial_questionnaire(@item)
        if user_application.save
          @item.destroy
          flash[:notice] = "Record approved"
          redirect_to admin_user_application_path(user_application)
        else
          flash[:error] = "Unable to approve record: #{user_application.errors.full_messages.to_sentence}"
          render action: :edit
        end
      end
    end
  end
end
