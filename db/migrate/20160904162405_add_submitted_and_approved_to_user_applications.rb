class AddSubmittedAndApprovedToUserApplications < ActiveRecord::Migration
  def change
    add_column :user_applications, :submitted, :boolean, default: false
    add_column :user_applications, :approved, :boolean, default: false
  end
end
