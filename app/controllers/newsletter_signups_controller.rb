class NewsletterSignupsController < ApplicationController
  def create
    @newsletter_signup = NewsletterSignup.new(newsletter_signup_params)
    if @newsletter_signup.save
      @success = true
      @pdf_url = ENV["PDF_URL"]
      ApplicationMailer.guide(@newsletter_signup.email, @pdf_url).deliver
    else
      @success = false
    end
  end

  private

  def newsletter_signup_params
    params.require(:newsletter_signup).permit(:email)
  end
end
