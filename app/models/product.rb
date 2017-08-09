class Product < ApplicationRecord
  belongs_to :brand
  validates :name, :price, :brand, presence: true
  validates :price, numericality: { less_than_or_equal_to: 100 }
end
