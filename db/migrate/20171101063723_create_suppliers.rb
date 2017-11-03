class CreateSuppliers < ActiveRecord::Migration[5.1]
  def change
    create_table :suppliers do |t|
      t.string :business_name
      t.string :address
      t.string :abn_number
      t.string :contact_number
      t.string :supplier_type
      t.string :email
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
