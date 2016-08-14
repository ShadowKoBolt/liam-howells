class ContactMailer < ApplicationMailer
  def new(contact)
    @contact = contact
    mail to: ENV["CONTACT_EMAIL"],
         subject: "New Website Contact"
  end
end
