class CreateInitialQuestionnaires < ActiveRecord::Migration
  def change
    create_table :initial_questionnaires do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :gender
      t.string :height
      t.string :weight
      t.integer :age
      t.text :how_did_you_find_out
      t.text :short_term_goals
      t.text :medical_issues
      t.string :primary_goal
      t.string :current_shape
      t.string :applied_before
      t.text :give_100_percent

      t.timestamps null: false
    end
  end
end
