# frozen_string_literal: true
class AddPackageIdToUserApplications < ActiveRecord::Migration
  def change
    add_column :user_applications, :package_id, :integer
  end
end
