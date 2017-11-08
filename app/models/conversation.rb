class Conversation < ApplicationRecord
  belongs_to :food_business
  belongs_to :supplier
  has_many :messages, -> { order(created_at: :asc) }, dependent: :destroy

  # scope :participating, -> (user) do
  #   where("(conversations.food_business_id = ? OR conversations.supplier_id = ?)", @food_business.id, @supplier.id)
  # end
end
