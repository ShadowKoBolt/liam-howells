# frozen_string_literal: true
class InitialQuestionnairesController < ApplicationController
  before_action :find_page

  def new
    @initial_questionnaire = InitialQuestionnaire.new
  end

  def create
    @initial_questionnaire = InitialQuestionnaire.
                             new(initial_questionnaire_params)
    if @initial_questionnaire.save
      InitialQuestionnaireMailer.new(@initial_questionnaire.id).deliver_now
      redirect_to new_initial_questionnaire_path, notice: t(".success")
    else
      render action: :new
    end
  end

  protected

  def initial_questionnaire_params
    params.require(:initial_questionnaire).permit!
  end

  def find_page
    @page = InitialQuestionnairePage.where(slug: "how-it-works").first
  end
end
