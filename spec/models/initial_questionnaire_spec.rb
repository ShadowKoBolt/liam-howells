require "rails_helper"

RSpec.describe InitialQuestionnaire, type: :model do
  it { should validate_presence_of :first_name }
  it { should validate_presence_of :last_name }
  it { should validate_presence_of :email }
  it { should validate_presence_of :gender }
  it do
    should validate_inclusion_of(:gender).in_array(InitialQuestionnaire::GENDER_OPTIONS)
  end
  it { should validate_presence_of :height }
  it { should validate_presence_of :weight }
  it { should validate_presence_of :date_of_birth }
  it { should validate_presence_of :how_did_you_find_out }
  it { should validate_presence_of :short_term_goals }
  it { should validate_presence_of :primary_goal }
  it do
    should validate_inclusion_of(:primary_goal).in_array(InitialQuestionnaire::PRIMARY_GOAL_OPTIONS)
  end
  it { should validate_presence_of :current_shape }
  it do
    should validate_inclusion_of(:current_shape).in_array(InitialQuestionnaire::CURRENT_SHAPE_OPTIONS)
  end
  it { should validate_presence_of :applied_before }
  it do
    should validate_inclusion_of(:applied_before).in_array(InitialQuestionnaire::APPLIED_BEFORE_OPTIONS)
  end
  it { should validate_presence_of :give_100_percent }

  it "should validate email is emaily" do
    iq = FactoryGirl.build(:initial_questionnaire, email: "not-an-email")
    expect(iq).to_not be_valid
  end
end
