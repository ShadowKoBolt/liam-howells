# frozen_string_literal: true
class CreatePackages < ActiveRecord::Migration
  def change
    create_table :packages do |t|
      t.string :name
      t.integer :price, default: 0
      t.text :description
      t.integer :position, default: 0

      t.timestamps null: false
    end
  end
end
