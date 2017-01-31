# frozen_string_literal: true
class UserApplication < ActiveRecord::Base
  validates :uuid, presence: true, uniqueness: true

  belongs_to :suggested_package, class_name: "Package"
  belongs_to :package

  before_validation :set_uuid

  default_scope { order(created_at: :desc) }

  def to_param
    uuid
  end

  def female?
    initial_questionnaire_attributes["gender"] == "Female"
  end

  def status_message
    if about && health
      if submitted
        if approved
          if subscription_id
            "Complete - someone will be in contact with you shortly"
          else
            "Waiting on payment - choose a package and we can get you started"
          end
        else
          "Waiting on review (someone will get back to you soon)"
        end
      else
        "Waiting on submission (ensure you are happy with all your answers and submit for review)"
      end
    else
      "Waiting for answers (see below)"
    end
  end

  def about_icon_class
    if about?
      "glyphicon glyphicon-ok text-success"
    else
      "glyphicon glyphicon-remove text-danger"
    end
  end

  def health_icon_class
    if health?
      "glyphicon glyphicon-ok text-success"
    else
      "glyphicon glyphicon-remove text-danger"
    end
  end

  def submitted_icon_class
    if submitted?
      "glyphicon glyphicon-ok text-success"
    else
      "glyphicon glyphicon-remove text-danger"
    end
  end

  def payment_icon_class
    if subscription_id?
      "glyphicon glyphicon-ok text-success"
    else
      "glyphicon glyphicon-remove text-danger"
    end
  end

  class << self
    def new_from_initial_questionnaire(iq)
      user_application = new
      user_application.initial_questionnaire_attributes = iq.attributes
      user_application.name = "#{iq.first_name} #{iq.last_name}"
      user_application.height = iq.height
      user_application.current_weight = iq.weight
      user_application.dob = iq.date_of_birth
      user_application.medical_conditions = iq.medical_issues
      user_application.email_address = iq.email
      user_application
    end
  end

  private

  def set_uuid
    self.uuid ||= SecureRandom.uuid
  end

  class Health < UserApplication
    validates :heart_condition, :chest_pain_when_exercising,
              :chest_pain_when_not_exercising, :dizziness,
              :bone_or_joint_problem, :blood_or_heart_medication,
              :other_medical_issues, presence: true

    def initialize(user_application)
      super(user_application.attributes)
      @new_record = user_application.new_record?
    end

    def percentage
      ret = (attrs.select { |attr| send("#{attr}?") }.count.to_f / attrs.count.to_f) * 100.to_f
      ret.round
    end

    def complete?
      health == true
    end

    def attrs
      %w{heart_condition chest_pain_when_exercising chest_pain_when_not_exercising dizziness bone_or_joint_problem blood_or_heart_medication other_medical_issues}
    end

    def model_name
      ActiveModel::Name.new(UserApplication)
    end
  end

  class About < UserApplication
    validates :name, :dob, :height, :current_weight, :target_weight,
              :current_waist_measurement, :contact_number,
              :email_address, :occupation, :time_at_work_spent,
              :medical_conditions,
              :how_did_you_find_out,
              :alcohol,
              :smoke, :finances, :last_hour_before_bed, :meal_preperation,
              :energy_levels,
              :working_hours, :bed_time, :fall_asleep,
              :wake_up_through_night,
              :eating_pattern, :eating_confidence, :caffeine, :water, :fad_diets,
              :training_split, :enjoying_routine, :training_likes,
              :training_improvement_areas,
              presence: true

    def initialize(user_application)
      super(user_application.attributes)
      @new_record = user_application.new_record?
    end

    def attrs
      ret = %w{ name dob height current_weight target_weight current_waist_measurement
          contact_number email_address occupation time_at_work_spent
          medical_conditions body_fat
          how_did_you_find_out short_term_goals long_term_goals
          how_healthy_do_you_feel alcohol smoke finances last_hour_before_bed
          stress working_hours bed_time fall_asleep
          wake_up_through_night eating_pattern eating_confidence caffeine water fad_diets
          training_split enjoying_routine training_likes
          training_improvement_areas meal_preperation energy_levels past_injuries }
      ret += %w{ menstrual_cycles pregnancy } if female?
      ret
    end

    def percentage
      ret = (attrs.select { |attr| !send("#{attr}").send(:nil?) }.count.to_f / attrs.count.to_f) * 100.to_f
      ret.round
    end

    def complete?
      about == true
    end

    def model_name
      ActiveModel::Name.new(UserApplication)
    end
  end

  class Payment < UserApplication
    def initialize(user_application)
      super(user_application.attributes)
    end

    def complete?
      subscription_id.present?
    end
  end
end
