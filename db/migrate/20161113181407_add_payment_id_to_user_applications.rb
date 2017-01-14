# frozen_string_literal: true
class AddPaymentIdToUserApplications < ActiveRecord::Migration
  def change
    add_column :user_applications, :payment_id, :string
  end
end
