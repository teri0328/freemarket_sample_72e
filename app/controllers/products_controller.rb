class ProductsController < ApplicationController
  before_action :set_params
  before_action :authenticate_user!, except: [:index]

  def index
    @products = Product.includes(:images).order('created_at DESC')
    @categorise = Product.where(category_id: 3).order('created_at DESC')
    # @sold_out = Category.where(category_id: @categorise.ids)
  end

  def new
    @products = Product.new
  end

  def create
    @product = Product.new(params.require(:product).permit(:id, :explanation, :name, :region, :size, :price, :shipping_days, :postage, :created_at, :updated_at).merge(user_id: "1", condition_id: "1", category_id: "1", bland_id: "1"))
    @product.save!
  end

  # 以下、ビュー表示用の仮アクション
  def authenticate
  end

  def telephone
  end

  def select
  end

  def registration
  end

  def result
  end

  def buy
  end

  def about
  end

  def master
  end

  private

  def set_params
    
  end
end
