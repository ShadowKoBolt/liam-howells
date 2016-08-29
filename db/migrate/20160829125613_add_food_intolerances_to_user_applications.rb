class AddFoodIntolerancesToUserApplications < ActiveRecord::Migration
  def change
    add_column :user_applications, :food_intolerances, :text
  end
end
