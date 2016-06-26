require "rails_helper"

RSpec.feature "Initial questionnaire" do
  background do
    clear_emails
  end

  scenario "User completes form successfully" do
    expect(InitialQuestionnaire.count).to eq(0)
    visit new_initial_questionnaire_path
    simple_attributes = FactoryGirl.
                        attributes_for(:initial_questionnaire_form)
    fill_form_and_submit :initial_questionnaire, simple_attributes
    expect(InitialQuestionnaire.count).to eq(1)
    expect(current_path).to eq(new_initial_questionnaire_path)
    expect(page).
      to have_content(I18n.t("initial_questionnaires.create.success"))
    open_email("nick@yoomee.com")
    current_email.click_link("Click here to view it")
  end

  scenario "User completes form with missing fields" do
    expect(InitialQuestionnaire.count).to eq(0)
    visit new_initial_questionnaire_path
    simple_attributes = FactoryGirl.
                        attributes_for(:initial_questionnaire_form).
                        except(:email)
    fill_form_and_submit :initial_questionnaire, simple_attributes
    expect(InitialQuestionnaire.count).to eq(0)
    expect(page).
      to have_content("can't be blank")
  end
end
