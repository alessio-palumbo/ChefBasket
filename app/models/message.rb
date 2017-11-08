class Message < ApplicationRecord
  validates :content, presence: true

  belongs_to :conversation
  belongs_to :sender, class_name: 'User'
end
