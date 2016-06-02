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
    end
  end
end
