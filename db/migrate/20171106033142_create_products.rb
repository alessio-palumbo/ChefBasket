class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.references :supplier, foreign_key: true
      t.string :product_code
      t.string :product_variety
      t.string :name
      t.string :quantifier
      t.integer :stock_level
      t.decimal :price
      t.decimal :discount

      t.timestamps
    end
  end
end
