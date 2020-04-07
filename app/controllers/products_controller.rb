class ProductsController < ApplicationController
  before_action :set_params
  before_action :authenticate_user!, except: [:index, :show]

  def index
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(params.require(:product).permit(:id, :explanation, :name, :region, :size, :price, :shipping_days, :postage, :created_at, :updated_at).merge(user_id: "1", condition_id: "1", category_id: "1", bland_id: "1"))
    @product.save!
  end

  def show
    @product    = Product.find(params[:id])
    @user       = User.find(@product.user_id)
    @bland      = Bland.find(@product.bland_id)
    @category   = Category.find(@product.category_id)
    @condition  = Condition.find(@product.condition_id)
    @address    = Address.where(user_id: @product.user_id)
    @evaluation = Evaluation.where(user_id: @product.user_id)
    @images     = Image.where(product_id: @product.id)
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
