class Address < ApplicationRecord
  belongs_to :user, optional: true
  validates :post_number, :prefecture, :city, :address, presence: true
  
  validates :post_number, format: {with: /\A[ぁ-んァ-ン一-龥]/}
end