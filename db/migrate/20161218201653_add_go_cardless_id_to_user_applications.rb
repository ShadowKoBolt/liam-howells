class AddGoCardlessIdToUserApplications < ActiveRecord::Migration
  def change
    add_column :user_applications, :go_cardless_id, :string
  end
end
