require "rails_helper"

RSpec.describe InitialQuestionnaireMailer, type: :mailer do
  describe "new" do
    let(:iq) { FactoryGirl.create(:initial_questionnaire) }
    let(:mail) { InitialQuestionnaireMailer.new(iq.id) }

    it "renders the headers" do
      expect(mail.subject).to eq("New Initial Questionnaire")
      expect(mail.to).to eq(["nick@yoomee.com"])
      expect(mail.from).to eq(["donotreply@example.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Click here to view it")
    end
  end
end
