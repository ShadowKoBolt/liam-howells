# frozen_string_literal: true
class InitialQuestionnaire < ActiveRecord::Base
  GENDER_OPTIONS = ["Male", "Female", "Prefer not to disclose"].freeze
  PRIMARY_GOAL_OPTIONS = ["Lose body fat",
                          "Gain muscle (tone up)",
                          "New to fitness (interested in basics)"].freeze
  CURRENT_SHAPE_OPTIONS = ["Awesome shape", "Average shape", "Terrible shape"].freeze
  APPLIED_BEFORE_OPTIONS = %w(Yes No).freeze

  validates :first_name, :last_name, :email, :gender, :height, :weight,
            :how_did_you_find_out, :short_term_goals, :primary_goal,
            :current_shape, :applied_before, :give_100_percent, :date_of_birth,
            presence: true
  validates :email, email: true
  validates :gender, inclusion: { in: GENDER_OPTIONS }
  validates :primary_goal, inclusion: { in: PRIMARY_GOAL_OPTIONS }
  validates :current_shape, inclusion: { in: CURRENT_SHAPE_OPTIONS }
  validates :applied_before, inclusion: { in: APPLIED_BEFORE_OPTIONS }

  default_scope { order(created_at: :desc) }

  def age
    now = Time.now.utc.to_date
    now.year - date_of_birth.year - (date_of_birth.to_date.change(year: now.year) > now ? 1 : 0)
  end
end
