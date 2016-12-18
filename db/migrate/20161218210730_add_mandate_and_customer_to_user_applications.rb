class AddMandateAndCustomerToUserApplications < ActiveRecord::Migration
  def change
    add_column :user_applications, :mandate, :string
    add_column :user_applications, :customer, :string
  end
end
