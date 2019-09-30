class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :product

  validates :comment_body, presence: true
  validates :comment_title, presence: true
  validates :user, presence: true
  validates :product, presence: true
  validates :star_rating, numericality: {only_integer: true}

  scope :star_rating_desc, -> {order(star_rating: :desc)}
  scope :star_rating_ascending, -> {order(star_rating: :asc)}
end
