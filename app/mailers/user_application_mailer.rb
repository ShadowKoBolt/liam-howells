class UserApplicationMailer < ApplicationMailer
  def submitted(user_application)
    @show_url = smug.admin_user_application_url(user_application)
    mail to: ENV["USER_APPLICATION_EMAIL"],
         subject: "New User Application"
  end
end
