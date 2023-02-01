require "rails_helper"

RSpec.describe Project, type: :model do
  describe "some Project model testing" do

    let(:project) { build(:project, user_id: 1, salary_per_hour: 3600, salary_per_hour_currency: "RUB") }

    it "Correctly creates turbo stream name to use in views" do
      expect(project.stream_name).to eql('projects_1')
    end

    it "Correctly returns currency" do
      expect(project.salary.currency.to_s).to eql("RUB")
    end

    it "Fails to save project without title" do
      expect { create(:project, title: "") }.to raise_error.with_message(/Title can't be blank/)
    end

    it "Correctly counts salary" do
      expect(project.salary(100).amount).to eql(100)
    end
  end
end
