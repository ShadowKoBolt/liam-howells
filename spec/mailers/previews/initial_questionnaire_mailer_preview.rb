# frozen_string_literal: true
# Preview all emails at http://localhost:3000/rails/mailers/initial_questionnaire_mailer
class InitialQuestionnaireMailerPreview < ActionMailer::Preview
  # Preview this email at http://localhost:3000/rails/mailers/initial_questionnaire_mailer/new
  def new
    InitialQuestionnaireMailer.new
  end
end
