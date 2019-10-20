require  'rails_helper'

describe Order  do
  context "a new order has no total" do
    let (:product) {Product.create!(name: "Racing bike", description: "Fast and easy to ride", image_url: "https://images.pexels.com/photos/2909076/pexels-photo-2909076.jpeg?cs=srgb&dl=baume-baumstamm-dammerung-2909076.jpg&fm=jpg", colour: "black", price: "110" )}
    let (:user) {FactoryBot.create(:user)}
    it "returns an invalid order" do
      expect(Order.new(product: product, user: user)).not_to be_valid
    end
  end

  context "a new order has a total" do
    let (:product) {Product.create!(name: "Racing bike", description: "Fast and easy to ride", image_url: "https://images.pexels.com/photos/2909076/pexels-photo-2909076.jpeg?cs=srgb&dl=baume-baumstamm-dammerung-2909076.jpg&fm=jpg", colour: "black", price: "110" )}
    let (:user) {FactoryBot.create(:user)}
    it "returns a valid order" do
      expect(Order.new(product: product, user: user, total: 110)).to be_valid
    end
  end

end
