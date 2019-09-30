class Product < ApplicationRecord
  has_many :orders
  has_many :comments
  validates :name, presence: true
  validates :description, presence: true
  validates :image_url, presence: true
  validates :colour, presence: true
  validates :price, numericality: {only_integer: true}

  def self.search(search_term)
    if Rails.env.development?
      Product.where("name LIKE ?", "%#{search_term}%")
    else
      Product.where("name ilike ?", "%#{search_term}%")
    end
  end

  def highest_rating_comment
    comments.star_rating_desc.all
  end

  def lowest_rating_comment
    comments.star_rating_ascending.first
  end

  def average_rating
    comments.average(:star_rating).to_f
  end

end
