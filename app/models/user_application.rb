class UserApplication < ActiveRecord::Base
  validates :uuid, presence: true, uniqueness: true

  before_validation :set_uuid

  def to_param
    uuid
  end

  class << self
    def new_from_initial_questionnaire(iq)
      user_application = new
      user_application.initial_questionnaire_attributes = iq.attributes
      user_application.name = "#{iq.first_name} #{iq.last_name}"
      user_application.height = iq.height
      user_application.current_weight = iq.weight
      user_application.medical_conditions = iq.medical_issues
      user_application
    end
  end

  private

  def set_uuid
    self.uuid ||= SecureRandom.uuid
  end
end
