class Conversation < ApplicationRecord
  belongs_to :food_business
  belongs_to :supplier
  has_many :messages, -> { order(created_at: :asc) }, dependent: :destroy

end
