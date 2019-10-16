require 'rails_helper'

describe Comment do
  context "a new comment entry has no comment_title" do
    let (:product) { Product.create!(name: "Race bike", description: "Fast and easy to ride", image_url: "https://images.pexels.com/photos/2909076/pexels-photo-2909076.jpeg?cs=srgb&dl=baume-baumstamm-dammerung-2909076.jpg&fm=jpg", colour: "black", price: "110") }
    let (:user) {User.create!(first_name: "Rosa", last_name: "Luxemburg", email: "rosa3.lux@example.com", password: "test123")}
    it "returns an invalid comment" do
      expect(Comment.new(product: product, user: user, comment_body: "I like it.", star_rating: "5")).not_to be_valid
    end
  end
  context "a new comment entry has a comment_title, comment_body and star_rating" do
    let (:product) { Product.create!(name: "Race bike", description: "Fast and easy to ride", image_url: "https://images.pexels.com/photos/2909076/pexels-photo-2909076.jpeg?cs=srgb&dl=baume-baumstamm-dammerung-2909076.jpg&fm=jpg", colour: "black", price: "110") }
    let (:user) {User.create!(first_name: "Rosa", last_name: "Luxemburg", email: "rosa2.lux@example.com", password: "test123")}
    it "returns a valid comment" do
      expect(Comment.new(product: product, user: user, comment_title: "Best Bike", comment_body: "I like it.", star_rating: "5")).to be_valid
    end
  end
end
