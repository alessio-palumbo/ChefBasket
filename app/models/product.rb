class Product < ApplicationRecord 
  validates :product_code, :name, :quantifier, :price, presence: true
  validates :price, numericality: { greater_than: 0 }
  # validates :product_variety, uniqueness: true

  belongs_to :supplier 
  has_many :order_products
  has_many :orders, through: :order_products

  def self.search(search)
    keyword = search.downcase
    where("lower(name) LIKE ? OR lower(product_variety) LIKE ?", "%#{keyword}%", "%#{keyword}%")
  end
end
