class Product < ApplicationRecord
  belongs_to :user
  belongs_to :like
  belongs_to :bland
  belongs_to :evaluation
  has_many :conditions
  has_many :categories, through: product_category, dependent: :destroy
  has_many :images, dependent: :destroy
  accepts_nested_attributes_for :images
end
