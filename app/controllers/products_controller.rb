class ProductsController < ApplicationController
  before_action :set_params, only: :create
  before_action :set_product, only: [:show, :destroy, :buy, :pay, :create_like, :destroy_like, :create_comment]
  before_action :authenticate_user!, except: [:index, :show]
  require 'payjp'
  require 'date'
  
  def index
    @used_id = []
    @products = Product.includes(:images).order('created_at DESC')
    @categorize = Product.where(category_id: 3).order('created_at DESC')
    respond_to do |format|
      format.html
      format.json

    # 福永
    @gen1s = Category.where(ancestry: nil)
    

    @gen2s = []
    @gen1s.each do |gen1|
      @gen2s << gen1.children
    end

    @gen3s = []
    @gen2s.each do |gen2s|
      gen2s.each do |gen2|
        @gen3s << gen2.children
      end
    end

  end

  def new
    @products = Product.new
  end

  def create
    @product = Product.new(set_params)
    unless @product.save!
      redirect_to new_product_path
    end
  end

  def show
    @user       = User.find(@product.user)
    @bland      = Bland.find(@product.bland)
    @category   = Category.where(product_id: @product.id)
    @condition  = Condition.find(@product.condition)
    @address    = Address.where(user_id: @product.user)
    @evaluation = Evaluation.where(user_id: @product.user)
    @images     = Image.where(product_id: @product.id)
    @comment    = Comment.new
    @comments   = Comment.where(product_id: @product.id)
    @likenum    = 0
  end
  
  def destroy
    unless @product.destroy
      redirect_to product_path(@product)
    end
  end

  def buy
    unless @product.soldout
      @address = Address.where(user_id: current_user.id)[0]
      @image   = Image.where(product_id: @product.id)[0]
      @card_ex = Card.where(user_id: current_user.id)
      if @card_ex.exists?
        @card     = Card.where(user_id: current_user.id).first
        Payjp.api_key = ENV['PAYJP_PRIVATE_KEY']
        customer = Payjp::Customer.retrieve(@card.customer_id)
        @default_card_information = Payjp::Customer.retrieve(@card.customer_id).cards.data[0]
      end
    else
      redirect_to product_path(@product)
    end
  end

  def pay
    unless @product.soldout
      @card = Card.where(user_id: current_user.id).first
      @product.soldout = true
      @product.save!
      Payjp.api_key = ENV['PAYJP_PRIVATE_KEY']
      @charge = Payjp::Charge.create(
      amount: @product.price,
      customer: @card.customer_id,
      currency: 'jpy'
      )
    else
      redirect_to product_path(@product)
    end
  end

  def search
    return nil if params[:keyword] == ""
    @products = Product.where(["name LIKE ?", "%#{params[:keyword]}%"])
  end

  def create_like
    like = Like.new(user_id: current_user.id, product_id: @product.id)
    unless like.save!
      redirect_to product_path(@product)
    end
  end

  def destroy_like
    like = Like.find_by(user_id: current_user.id, product_id: @product.id)
    unless like.destroy!
      redirect_to product_path(@product)
    end
  end
  
  def create_comment
    @comment = Comment.new(comment: params[:comment], user_id: current_user.id, product_id: @product.id)
    unless @comment.save!
      redirect_to product_path(@product)
    end
  end
  
  private

  def set_product
    @product = Product.find(params[:id])
  end

  def set_params
    # ダミーです、商品出品と編集に使用します
    params.require(:product).permit(:id, :explanation, :name, :region, :size, :price, :shipping_days, :postage, :created_at, :updated_at).merge(user_id: "1", condition_id: "1", category_id: "1", bland_id: "1")
  end

end

