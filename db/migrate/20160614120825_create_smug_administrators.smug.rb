# This migration comes from smug (originally 1)
class CreateSmugAdministrators < ActiveRecord::Migration
  def self.up
    create_table(:smug_administrators) do |t|
      ## Database authenticatable
      t.string :email,              null: false, default: ""
      t.string :encrypted_password, null: false, default: ""

      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      ## Rememberable
      t.datetime :remember_created_at

      ## Trackable
      t.integer  :sign_in_count, default: 0, null: false
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.inet     :current_sign_in_ip
      t.inet     :last_sign_in_ip
    end

    add_index :smug_administrators, :email,                unique: true
    add_index :smug_administrators, :reset_password_token, unique: true
    # add_index :smug_administrators, :confirmation_token,   unique: true
    # add_index :smug_administrators, :unlock_token,         unique: true
  end

  def self.down
    drop_table(:smug_administrators)
  end
end
