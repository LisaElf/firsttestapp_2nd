class Order < ApplicationRecord
  belongs_to :product, optional: true
end
