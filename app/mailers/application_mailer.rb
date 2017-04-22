# frozen_string_literal: true
require 'open-uri'

class ApplicationMailer < ActionMailer::Base
  default from: ENV["FROM_EMAIL"]

  layout "mailer"

  def guide(email, pdf_url)
    attachments['Liam Howells Guide.pdf'] = open(pdf_url).read
    mail(to: email, subject: 'Liam Howells Guide')
  end
end
