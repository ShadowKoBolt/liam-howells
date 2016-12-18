# frozen_string_literal: true
class UserApplicationsController < ApplicationController
  def show
    @user_application = UserApplication.find_by_uuid(params[:id])
    @health = UserApplication::Health.new(@user_application)
    @about = UserApplication::About.new(@user_application)
  end

  def health
    @user_application = UserApplication.find_by_uuid(params[:id])
    @health = UserApplication::Health.new(@user_application)
    if request.post?
      @health.health = true
      if @health.update_attributes(health_params)
        redirect_to user_application_path(@health)
      else
        render action: :health
      end
    end
  end

  def about
    @user_application = UserApplication.find_by_uuid(params[:id])
    @about = UserApplication::About.new(@user_application)
    if request.post?
      @about.about = true
      if @about.update_attributes(about_params)
        redirect_to user_application_path(@about)
      else
        render action: :about
      end
    end
  end

  def submit_for_review
    @user_application = UserApplication.find_by_uuid(params[:id])
    UserApplicationMailer.submitted(@user_application).deliver_now
    @user_application.update_attribute(:submitted, true)
    redirect_to user_application_path(@user_application)
  end

  def payment
    @user_application = UserApplication.find_by_uuid(params[:id])
    redirect_to(user_application_path(@user_application)) unless @user_application.approved?
    @packages = Package.all
  end

  def payment_redirect
    user_application = UserApplication.find_by_uuid(params[:id])
    package = Package.find(params[:package_id])
    redirect_flow = GocardlessClient.redirect_flows.create(
      params: {
        description: "Liam Howells - #{package.name} package",
        session_token: "session_id_#{user_application.id}",
        success_redirect_url: payment_success_url
      }
    )
    user_application.update_attributes(go_cardless_id: redirect_flow.id,
                                       package: package)
    redirect_to redirect_flow.redirect_url
  end

  def payment_process
  end

  protected

  def health_params
    params.require(:user_application).permit(@health.attrs)
  end

  def about_params
    params.require(:user_application).permit(@about.attrs)
  end
end
