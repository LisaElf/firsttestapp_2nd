require 'rails_helper'

describe Product do
  context "when the product has comments" do
    let (:product) { Product.create!(name: "Race bike", description: "Fast and easy to ride", image_url: "https://images.pexels.com/photos/2909076/pexels-photo-2909076.jpeg?cs=srgb&dl=baume-baumstamm-dammerung-2909076.jpg&fm=jpg", colour: "black", price: "110") }
    let (:user) {User.create!(first_name: "Rosa", last_name: "Luxemburg", email: "rosa1.lux@example.com", password: "test123")}
    before do
      product.comments.create!(star_rating: 1, user: user, comment_title: "Hey", comment_body: "Aweful!")
      product.comments.create!(star_rating: 3, user: user, comment_title: "Ho", comment_body: "Ok!")
      product.comments.create!(star_rating: 5, user: user, comment_title: "Lets go", comment_body: "Love it!")
    end
    it "returns the average rating of all comments" do
      expect(product.average_rating).to eq 3.0
    end
  end
  context "a new product entry has no name" do
    it "returns an invalid product" do
      expect(Product.new(description:"Fast bike",  image_url: "https://images.pexels.com/photos/2909076/pexels-photo-2909076.jpeg?cs=srgb&dl=baume-baumstamm-dammerung-2909076.jpg&fm=jpg", colour: "black", price: "110")).not_to be_valid
    end
  end
  context "a new product entry has a name, description, image url, colour and price" do
    it "returns a valid product" do
      expect(Product.new(name: "Race bike", description: "Fast and easy to ride", image_url: "https://images.pexels.com/photos/2909076/pexels-photo-2909076.jpeg?cs=srgb&dl=baume-baumstamm-dammerung-2909076.jpg&fm=jpg", colour: "black", price: "110")).to be_valid
    end
  end
end
