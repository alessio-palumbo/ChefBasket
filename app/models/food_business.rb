class FoodBusiness < ApplicationRecord
  include ImageUploader::Attachment.new(:image)
  
  validates :business_name, :address, :abn_number, :contact_number, :business_category, :email, presence: true
  validates :business_name, :abn_number, uniqueness: true

  belongs_to :user
  has_and_belongs_to_many :suppliers
  has_many :orders

  def self.search(search)
    keyword = search.downcase
    where("lower(business_name) LIKE ? OR lower(business_category) LIKE ?", "%#{keyword}%", "%#{keyword}%")
  end

end
