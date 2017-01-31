class NewsletterSignup < ActiveRecord::Base
  validates :email, email: true, presence: true
end
