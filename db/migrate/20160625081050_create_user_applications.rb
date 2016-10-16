# frozen_string_literal: true
class CreateUserApplications < ActiveRecord::Migration
  def change
    create_table :user_applications do |t|
      t.string :uuid
      t.json :initial_questionnaire_attributes
      t.string :name
      t.date :dob
      t.string :height
      t.integer :current_weight
      t.integer :target_weight
      t.string :body_fat
      t.string :current_waist_measurement
      t.string :contact_number
      t.string :email_address
      t.string :occupation
      t.text :time_at_work_spent
      t.text :medical_conditions
      t.text :pregnancy
      t.text :past_injuries
      t.text :medical_issues
      t.text :how_did_you_find_out
      t.text :short_term_goals
      t.text :long_term_goals
      t.text :how_healthy_do_you_feel
      t.text :alcohol
      t.text :smoke
      t.text :finances
      t.text :last_hour_before_bed
      t.text :meal_preperation
      t.string :food_shop
      t.boolean :stress
      t.text :menstrual_cycles
      t.text :energy_levels
      t.text :working_hours
      t.text :struggle_with_sleep
      t.text :bed_time
      t.text :fall_asleep
      t.text :wake_up_through_night
      t.text :wake_up_naturally
      t.text :sleep_pattern_effected
      t.text :eating_pattern
      t.text :eating_confidence
      t.string :caffeine
      t.string :water
      t.text :fad_diets
      t.text :supplements
      t.text :training_split
      t.text :enjoying_routine
      t.text :training_likes
      t.text :training_dislikes
      t.text :training_time
      t.text :training_improvement_areas
      t.string :heart_condition
      t.string :chest_pain_when_exercising
      t.string :chest_pain_when_not_exercising
      t.string :dizziness
      t.string :bone_or_joint_problem
      t.string :blood_or_heart_medication
      t.string :other_medical_issues

      t.timestamps null: false
    end
  end
end
