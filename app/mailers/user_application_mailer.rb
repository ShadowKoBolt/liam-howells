# frozen_string_literal: true
class UserApplicationMailer < ApplicationMailer
  def submitted(user_application)
    @show_url = smug.edit_admin_user_application_url(user_application)
    mail to: ENV["USER_APPLICATION_EMAIL"],
         subject: "New User Application"
  end
end
