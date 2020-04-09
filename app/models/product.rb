class Product < ApplicationRecord
  belongs_to :user
  belongs_to :bland
  belongs_to :condition
  has_one :category
  has_many :images, dependent: :destroy
  accepts_nested_attributes_for :images
end
