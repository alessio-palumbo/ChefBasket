class OrderProduct < ApplicationRecord
  validates :quantity, numericality: { greater_than_or_equal_to: 0 }

  belongs_to :order
  belongs_to :product

  def subtotal
    quantity * product.price
  end

end
