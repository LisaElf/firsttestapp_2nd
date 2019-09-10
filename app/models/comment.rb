class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :product

  scope :star_rating_desc, -> {order(star_rating: :desc)}
  scope :star_rating_ascending, -> {order(star_rating: :asc)}
end
