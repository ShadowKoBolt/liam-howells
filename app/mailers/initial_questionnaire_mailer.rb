# frozen_string_literal: true
class InitialQuestionnaireMailer < ApplicationMailer
  def new(iq_id)
    @show_url = smug.admin_initial_questionnaire_url(id: iq_id)
    mail to: ENV["IQ_EMAIL"],
         subject: "New Initial Questionnaire"
  end
end
