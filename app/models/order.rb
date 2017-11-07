class Order < ApplicationRecord
  validates :supplier_id, :order_number, presence: true
  validates :order_number, uniqueness: true
  validate :valid_date? 

  belongs_to :food_business
  belongs_to :supplier
  has_many :order_products, dependent: :destroy
  has_many :products, through: :order_products

  def valid_date?
    if delivery_date < 1.day.from_now(Date.today) 
      errors.add(:delivery_date, "can't be today")
    end
  end
end
