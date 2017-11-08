class CreateConversations < ActiveRecord::Migration[5.1]
  def change
    create_table :conversations do |t|
      t.references :food_business, foreign_key: true
      t.references :supplier, foreign_key: true

      t.timestamps
    end
  end
end
