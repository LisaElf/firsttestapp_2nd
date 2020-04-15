require 'rails_helper'

describe Product do
  context "when the product has comments" do
    let (:product) { FactoryBot.create(:product) }
    let (:user) { FactoryBot.create(:user) }
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
      @product= FactoryBot.build(:product, name: nil)
      expect(@product).not_to be_valid
    end
  end
  context "a new product entry has a name, description, image url, colour and price" do
    it "returns a valid product" do
      expect(FactoryBot.build(:product)).to be_valid
    end
  end
end
