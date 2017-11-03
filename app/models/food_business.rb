class FoodBusiness < ApplicationRecord
  belongs_to :user

  belongs_to :supplier
  has_many :suppliers
end
