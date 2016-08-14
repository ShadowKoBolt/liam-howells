class ContactRequest < ActiveRecord::Base
  validates :first_name, :last_name, :email, :message, presence: true

  after_create :send_email

  protected

  def send_email
    ContactMailer.new(self).deliver_now
  end
end
