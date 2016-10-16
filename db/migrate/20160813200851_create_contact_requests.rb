# frozen_string_literal: true
class CreateContactRequests < ActiveRecord::Migration
  def change
    create_table :contact_requests do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :phone
      t.string :city
      t.text :message

      t.timestamps null: false
    end
  end
end
