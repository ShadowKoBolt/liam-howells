# frozen_string_literal: true
class ContactMailer < ApplicationMailer
  def new(contact)
    @contact = contact
    mail to: ENV["CONTACT_EMAIL"],
         subject: "New Website Contact"
  end
end
