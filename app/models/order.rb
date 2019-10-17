class Order < ActiveRecord::Base
  belongs_to :product, optional: true
  belongs_to :user

  validates :total, presence: true
end
