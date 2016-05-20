class InitialQuestionnairesController < ApplicationController
  def new
    @initial_questionnaire = InitialQuestionnaire.new
  end

  def create
  end
end
