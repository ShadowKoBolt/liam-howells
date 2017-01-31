class NewsletterSignupsController < ApplicationController
  def create
    @newsletter_signup = NewsletterSignup.new(newsletter_signup_params)
    if @newsletter_signup.save
      @success = true
    else
      @success = false
    end
  end

  private

  def newsletter_signup_params
    params.require(:newsletter_signup).permit(:email)
  end
end
