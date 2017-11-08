class AddImageDataToSuppliers < ActiveRecord::Migration[5.1]
  def change
    add_column :suppliers, :image_data, :text
  end
end
