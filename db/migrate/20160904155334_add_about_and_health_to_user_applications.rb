class AddAboutAndHealthToUserApplications < ActiveRecord::Migration
  def change
    add_column :user_applications, :about, :boolean, default: false
    add_column :user_applications, :health, :boolean, default: false
  end
end
