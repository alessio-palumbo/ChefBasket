class AddImageDataToFoodBusinesses < ActiveRecord::Migration[5.1]
  def change
    add_column :food_businesses, :image_data, :text
  end
end
