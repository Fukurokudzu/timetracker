require "rails_helper"

RSpec.describe User, type: :model do
  it "Doesn't create user without email" do
    expect { create(:user, email: "") }.to raise_error
  end
end
