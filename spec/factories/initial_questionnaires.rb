FactoryGirl.define do
  factory :initial_questionnaire do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    email { Faker::Internet.email(first_name) }
    gender { InitialQuestionnaire::GENDER_OPTIONS.sample }
    height "6ft 2in"
    weight "13 1/2 stone"
    age { (16..60).to_a.sample }
    how_did_you_find_out { Faker::Lorem.sentence }
    short_term_goals { Faker::Lorem.sentence }
    medical_issues { [Faker::Lorem.sentence, nil].sample }
    primary_goal { InitialQuestionnaire::PRIMARY_GOAL_OPTIONS.sample }
    current_shape { InitialQuestionnaire::CURRENT_SHAPE_OPTIONS.sample }
    applied_before { InitialQuestionnaire::APPLIED_BEFORE_OPTIONS.sample }
    give_100_percent { Faker::Lorem.sentence }
  end
end
