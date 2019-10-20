require 'rails_helper'

describe User do
  context "a new user without an email address" do
    it "returns an invalid user" do
      @user = FactoryBot.build(:user, email: nil)
      expect(@user).not_to be_valid
    end
  end
  context "a new user with an email address and a password" do
    it "returns a valid user" do
      expect(FactoryBot.build(:user)).to be_valid
    end
  end
end
