# frozen_string_literal: true
class AddSuggestedPackageToUserApplications < ActiveRecord::Migration
  def change
    add_reference :user_applications, :suggested_package, index: true
  end
end
