class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.date :delivery_date
      t.references :food_business, foreign_key: true
      t.references :supplier, foreign_key: true
      t.decimal :gross_total
      t.decimal :gst
      t.string :order_number

      t.timestamps

      t.index :created_at
    end
  end
end
