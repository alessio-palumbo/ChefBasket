class Supplier < ApplicationRecord
  validates :business_name, :address, :abn_number, :contact_number, :business_category, :email, presence: true
  validates :business_name, :abn_number, uniqueness: true

  belongs_to :user
  has_and_belongs_to_many :food_businesses
  has_many :orders, through: :food_businesses
  has_many :products, dependent: :destroy

  def self.search(search)
    keyword = search.downcase
    where("lower(business_name) LIKE ? OR lower(supplier_type) LIKE ?", "%#{keyword}%", "%#{keyword}%")
  end
end
