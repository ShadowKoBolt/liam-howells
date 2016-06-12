class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.string :type
      t.string :name
      t.string :slug
      t.jsonb :content

      t.timestamps null: false
    end

    add_index :pages, :slug, :unique => true
  end
end
