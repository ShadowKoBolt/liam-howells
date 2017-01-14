# frozen_string_literal: true
class AddMandateAndCustomerToUserApplications < ActiveRecord::Migration
  def change
    add_column :user_applications, :mandate, :string
    add_column :user_applications, :customer, :string
  end
end
