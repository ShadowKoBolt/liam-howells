# frozen_string_literal: true
FactoryGirl.define do
  factory :initial_questionnaire do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    email { Faker::Internet.email(first_name) }
    gender { InitialQuestionnaire::GENDER_OPTIONS.sample }
    height "160"
    weight "200"
    date_of_birth { (16..60).to_a.sample.years.ago }
    how_did_you_find_out { Faker::Lorem.sentence }
    short_term_goals { Faker::Lorem.sentence }
    medical_issues { [Faker::Lorem.sentence, ""].sample }
    primary_goal { InitialQuestionnaire::PRIMARY_GOAL_OPTIONS.sample }
    current_shape { InitialQuestionnaire::CURRENT_SHAPE_OPTIONS.sample }
    applied_before { InitialQuestionnaire::APPLIED_BEFORE_OPTIONS.sample }
    give_100_percent { Faker::Lorem.sentence }

    factory :initial_questionnaire_form do
      date_of_birth { "18/06/1986" }
    end
  end
end
