class FoodBusiness < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :suppliers

  def self.add_supplier(supplier)
    self.suppliers << supplier
  end

end
