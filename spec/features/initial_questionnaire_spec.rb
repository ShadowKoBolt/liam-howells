require "rails_helper"

SIMPLE_ATTRIBUTES = [
  :first_name,
  :last_name,
  :email,
  :height,
  :weight,
  :age,
  :how_did_you_find_out,
  :short_term_goals,
  :medical_issues,
  :give_100_percent
]

RSpec.feature "Initial questionnaire" do
  scenario "User completes form successfully" do
    expect(InitialQuestionnaire.count).to eq(0)
    visit new_initial_questionnaire_path
    simple_attributes = FactoryGirl.
      attributes_for(:initial_questionnaire)
    fill_form_and_submit :initial_questionnaire, simple_attributes
    expect(InitialQuestionnaire.count).to eq(1)
    expect(current_path).to eq(new_initial_questionnaire_path)
    expect(page).
      to have_content(I18n::t("initial_questionnaires.create.success"))
  end

  scenario "User completes form with missing fields" do
    expect(InitialQuestionnaire.count).to eq(0)
    visit new_initial_questionnaire_path
    simple_attributes = FactoryGirl.
      attributes_for(:initial_questionnaire).
      except(:email)
    fill_form_and_submit :initial_questionnaire, simple_attributes
    expect(InitialQuestionnaire.count).to eq(0)
    expect(page).
      to have_content("can't be blank")
  end
end
