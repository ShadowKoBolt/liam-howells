# frozen_string_literal: true
FactoryGirl.define do
  factory :user_application do
    uuid { SecureRandom.uuid }
    initial_questionnaire_attributes ""
    name "MyString"
    dob "2016-06-25"
    height "MyString"
    current_weight 1
    target_weight 1
    body_fat "MyString"
    current_waist_measurement "MyString"
    contact_number "MyString"
    email_address "MyString"
    occupation "MyString"
    time_at_work_spent "MyText"
    medical_conditions "MyText"
    pregnancy "MyText"
    past_injuries "MyText"
    medical_issues "MyText"
    how_did_you_find_out "MyText"
    short_term_goals "MyText"
    long_term_goals "MyText"
    how_healthy_do_you_feel "MyText"
    alcohol "MyText"
    smoke "MyText"
    finances "MyText"
    last_hour_before_bed "MyText"
    meal_preperation "MyText"
    food_shop "MyString"
    stress false
    menstrual_cycles "MyText"
    energy_levels "MyText"
    working_hours "MyText"
    struggle_with_sleep "MyText"
    bed_time "MyText"
    fall_asleep "MyText"
    wake_up_through_night "MyText"
    wake_up_naturally "MyText"
    sleep_pattern_effected "MyText"
    eating_pattern "MyText"
    eating_confidence "MyText"
    caffeine "MyString"
    water "MyString"
    fad_diets "MyText"
    supplements "MyText"
    training_split "MyText"
    enjoying_routine "MyText"
    training_likes "MyText"
    training_dislikes "MyText"
    training_time "MyText"
    training_improvement_areas "MyText"
    heart_condition "MyString"
    chest_pain_when_exercising "MyString"
    chest_pain_when_not_exercising "MyString"
    dizziness "MyString"
    bone_or_joint_problem "MyString"
    blood_or_heart_medication "MyString"
    other_medical_issues "MyString"
  end
end
