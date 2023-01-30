require "rails_helper"

RSpec.describe Project, type: :model do
  describe "some Project model testing" do
    it "Correctly creates turbo stream name to use in views" do
      project = build(:project, user_id: 1)
      expect(project.stream_name).to eql('projects_1')
    end

    it "Correctly returns currency" do
      project = build(:project, salary_per_hour: 3600, salary_per_hour_currency: "RUB")
      expect(project.salary.currency.to_s).to eql("RUB")
    end

    it "Fails to save project without title" do
      expect { create(:project, title: "") }.to raise_error.with_message(/Title can't be blank/)
    end
  end
end
