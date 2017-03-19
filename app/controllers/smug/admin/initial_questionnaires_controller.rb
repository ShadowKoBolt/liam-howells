# frozen_string_literal: true
module Smug
  module Admin
    class InitialQuestionnairesController < CrudController
      class << self
        def index_attrs
          %w{first_name last_name email created_at}
        end

        def item_actions
          [:edit, :update, :index, :destroy, :show]
        end

        def show_attrs
          %w{ first_name last_name email date_of_birth age gender height weight
              how_did_you_find_out short_term_goals medical_issues
              primary_goal current_shape applied_before give_100_percent }
        end
      end

      def convert
        find_item
        user_application = UserApplication.new_from_initial_questionnaire(@item)
        if user_application.save
          @item.destroy
          flash[:notice] = "Record approved"
          redirect_to edit_admin_user_application_path(user_application)
        else
          flash[:error] = "Unable to approve record: #{user_application.errors.full_messages.to_sentence}"
          render action: :edit
        end
      end
    end
  end
end
