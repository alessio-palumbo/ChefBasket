class CreateJoinTableFoodBusinessesSuppliers < ActiveRecord::Migration[5.1]
  def change
    create_join_table :food_businesses, :suppliers do |t|
      t.index [:food_business_id, :supplier_id], name: :idx_food_business_supplier 
      t.index [:supplier_id, :food_business_id], name: :idx_supplier_food_business
    end
  end
end
