class AddSubscriptionIdToUserApplications < ActiveRecord::Migration
  def change
    add_column :user_applications, :subscription_id, :string
  end
end
