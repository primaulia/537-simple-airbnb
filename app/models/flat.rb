class Flat < ApplicationRecord
  validates :name, presence: true
  validates :price_per_night, numericality: { only_integer: true }
end
