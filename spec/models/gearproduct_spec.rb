require 'rails_helper'

describe Gearproduct do
  context "a new gearproduct has a name, description, image_url and gear_type" do
    it "returns a valid gearproduct" do
      expect(Gearproduct.new(name: "Jersey 1", description: "comfortable and well-prized", image_url: "https://upload.wikimedia.org/wikipedia/commons/1/11/Gameday-Jersey.jpg", gear_type: "Jersey")).to be_valid
    end
  end
  context "a new gearproduct without a desription" do
    it "returns an invalid gearproduct" do
      expect(Gearproduct.new(name: "Jersey 1", image_url: "https://upload.wikimedia.org/wikipedia/commons/1/11/Gameday-Jersey.jpg", gear_type: "Jersey")).not_to be_valid
    end
  end
end
