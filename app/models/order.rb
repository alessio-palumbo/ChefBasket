class Order < ApplicationRecord
  belongs_to :food_business
  belongs_to :supplier
end
