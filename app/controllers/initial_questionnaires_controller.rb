class InitialQuestionnairesController < ApplicationController
  def new
    @initial_questionnaire = InitialQuestionnaire.new
  end

  def create
    @initial_questionnaire = InitialQuestionnaire.
      new(initial_questionnaire_params)
    if @initial_questionnaire.save
      redirect_to new_initial_questionnaire_path, notice: t(".success")
    else
      render action: :new
    end

  end

  protected

  def initial_questionnaire_params
    params.require(:initial_questionnaire).permit!
  end
end
