class FoodBusiness < ApplicationRecord
  validates :business_name, :address, :abn_number, :contact_number, :business_category, :email, presence: true
  validates :business_name, :abn_number, uniqueness: true

  belongs_to :user
  has_and_belongs_to_many :suppliers
  has_many :orders

  def self.add_supplier(supplier)
    self.suppliers << supplier
  end

end
