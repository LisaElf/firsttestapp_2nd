require 'rails_helper'

describe Gearproduct do
  context "a new gearproduct has a name, description, image_url and gear_type" do
    it "returns a valid gearproduct" do
      expect(FactoryBot.build(:gearproduct)).to be_valid
    end
  end

  context "a new gearproduct without a desription" do
    it "returns an invalid gearproduct" do
      @gearproduct= FactoryBot.build(:gearproduct, description: nil)
      expect(@gearproduct).not_to be_valid
    end
  end
end
