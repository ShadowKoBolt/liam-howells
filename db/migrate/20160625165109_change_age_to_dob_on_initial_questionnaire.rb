# frozen_string_literal: true
class ChangeAgeToDobOnInitialQuestionnaire < ActiveRecord::Migration
  def up
    remove_column :initial_questionnaires, :age
    add_column :initial_questionnaires, :date_of_birth, :date
  end

  def down
    add_column :initial_questionnaires, :age, :integer
    remove_column :initial_questionnaires, :date_of_birth
  end
end
