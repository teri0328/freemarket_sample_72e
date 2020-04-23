class Product < ApplicationRecord
  belongs_to :user
  belongs_to :bland, optional: true
  belongs_to :condition
  belongs_to :category
  has_many :images  , dependent: :destroy
  has_many :comments, dependent: :destroy
  accepts_nested_attributes_for :images, allow_destroy: true

  validates :name, :explanation, :region, :price, :shipping_days, presence: true
  validates :price, numericality: { only_integer: true , greater_than: 0, less_than: 9999999 }
end
