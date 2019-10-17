require 'rails_helper'

describe User do
  context "a new user without an email address" do
    it "returns an invalid user" do
      expect(User.new(password: "test123")).not_to be_valid
    end
  end
  context "a new user with an email address and a password" do
    it "returns a valid user" do
      expect(User.new(email: "rosa.lux8@text.com", password: "test123")).to be_valid
    end
  end
end
