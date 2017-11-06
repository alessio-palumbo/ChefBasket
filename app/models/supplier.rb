class Supplier < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :food_businesses
  has_many :orders

  def self.search(search)
    keyword = search.downcase
    where("lower(business_name) LIKE ? OR lower(supplier_type) LIKE ?", "%#{keyword}%", "%#{keyword}%")
  end
end
