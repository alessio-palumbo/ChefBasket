class Supplier < ApplicationRecord
  belongs_to :user

  belongs_to :food_business
  has_many :food_businesses
end
