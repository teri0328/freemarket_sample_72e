class ProductsController < ApplicationController
  before_action :set_params

  def index
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(params.require(:product).permit(:id, :explanation, :name, :region, :size, :price, :shipping_days, :postage, :created_at, :updated_at).merge(user_id: "1", condition_id: "1", category_id: "1", bland_id: "1"))
    @product.save!
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
