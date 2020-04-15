require 'rails_helper'

describe Comment do
  context "a new comment entry has no comment_title" do
    let (:product) { FactoryBot.build(:product) }
    let (:user) { FactoryBot.build(:user)}
    it "returns an invalid comment" do
      expect(Comment.new(product: product, user: user, comment_body: "I like it.", star_rating: "5")).not_to be_valid
    end
  end
  context "a new comment entry has a comment_title, comment_body and star_rating" do
    let (:product) { FactoryBot.build(:product) }
    let (:user) { FactoryBot.create(:user) }
    it "returns a valid comment" do
      expect(Comment.new(product: product, user: user, comment_title: "Best Bike", comment_body: "I like it.", star_rating: "5")).to be_valid
    end
  end
  context "a new comment entry has no user" do
    let (:product) { FactoryBot.build(:product)}
    it "returns an invalid comment" do
      expect(Comment.new(product: product, user: nil, comment_title: "Best Bike I had", comment_body: "I like it.", star_rating: "5")).not_to be_valid
    end
  end
  context "a new comment entry has a user" do
    let (:product) { FactoryBot.build(:product)}
    let(:user) { FactoryBot.build(:user)}
    it "returns a valid comment" do
      expect(Comment.new(product: product, user: user, comment_title: "Best Bike I had", comment_body: "I like it.", star_rating: "5")).to be_valid
    end
  end
end
