class UserApplicationsController < ApplicationController
  def show
    @user_application = UserApplication.find_by_uuid(params[:uuid])
  end
end
