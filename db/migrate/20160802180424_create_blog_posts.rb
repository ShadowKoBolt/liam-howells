# frozen_string_literal: true
class CreateBlogPosts < ActiveRecord::Migration
  def change
    create_table :blog_posts do |t|
      t.string :name
      t.text :content
      t.date :date
      t.string :image_id

      t.timestamps null: false
    end
  end
end
