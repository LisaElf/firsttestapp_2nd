class Gearproduct < ApplicationRecord
  validates :name, presence: true
  validates :description, presence: true
  validates :image_url, presence: true
  validates :gear_type, presence: true
end
