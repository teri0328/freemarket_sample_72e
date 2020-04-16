class ProductsController < ApplicationController
  before_action :set_params, only: [:create]
  before_action :set_product, only: [:show, :buy, :destroy, :pay, :edit, :update]
  before_action :authenticate_user!, except: [:index, :show]
  require 'payjp'

  def index
    @products = Product.includes(:images).order('created_at DESC')
    @categorise = Product.where(category_id: 1).order('created_at DESC')
  end

  def new
    @products = Product.new
    # @images = Image.new
    @products.images.new
  end

  def create
    @product = Product.new(set_params)
    unless @product.save!
      redirect_to new_product_path
    end
    # (params.require(:product).permit(:explanation, :name, :region, :size, :price, :shipping_days, :postage,:bland_id, :condition_id,:category_id, images_attributes: [:image] ).merge(user_id: current_user.id,))
    # @image = Image.new(params.require(:image).permit(:image, :product_id))
  
    # @image.save!
    # redirect_to product_path(@product)
    # unless @product.save!
    #   redirect_to new_product_path
    # end
    # for num in 1..10 do
    #   unless params[:product][:image][":image#{num}"].nil?
    #     @image = Image.new(image: params[:product][:image][":image#{num}"], product_id: @product.id)
    #     unless @image.save!
    #       redirect_to new_product_path
    #     end
    #   end
    # end
  end

  def show
    @user       = User.find(@product.user)
    @bland      = Bland.find(@product.bland)
    @category   = Category.where(product_id: @product.id)
    @condition  = Condition.find(@product.condition)
    @address    = Address.where(user_id: @product.user)
    @evaluation = Evaluation.where(user_id: @product.user)
    @images     = Image.where(product_id: @product.id)
  end

  def edit
    # @image = Image.find(params[:id])
  end

  def update
    @product.update(set_params)
    #   redirect_to root_path
    # else
    #   render :edit
    # end

    # for num in 1..3 do
    #   unless params[:image][":image#{num}"].nil?
    #     @image = Image.new(image: params[:product][:image][":image#{num}"], product_id: @product.id)
    #     unless @image.save!
    #       redirect_to new_product_path
    #     end
    #   end
    # end
  end


  def buy
    @address = Address.where(user_id: current_user.id)[0]
    @image   = Image.where(product_id: @product.id)[0]
    @card_ex = Card.where(user_id: current_user.id)
    if @card_ex.exists?
      card     = Card.where(user_id: current_user.id).first
      @card    = Card.find(params[:id])
      Payjp.api_key = ENV['PAYJP_PRIVATE_KEY']
      customer = Payjp::Customer.retrieve(card.customer_id)
      @default_card_information = Payjp::Customer.retrieve(card.customer_id).cards.data[0]
    end
  end

  def pay
    @card = Card.where(user_id: current_user.id)
    customer_card = ""
    @card.each do |c|
      customer_card = c
    end
    @product.soldout = true
    @product.save!
    Payjp.api_key = ENV['PAYJP_PRIVATE_KEY']
    @charge = Payjp::Charge.create(
    amount: @product.price,
    customer: customer_card.customer_id,
    currency: 'jpy'
    )
  end

  def destroy
    unless @product.destroy
      redirect_to product_path(@product)
    end
  end
  
  def search
    return nil if params[:keyword] == ""
    @products = Product.where(["name LIKE ?", "%#{params[:keyword]}%"])
    respond_to do |format|
      format.html
      format.json
    end
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def set_params
    # ダミーです、商品出品と編集に使用します
    params.require(:product).permit(:explanation, :name, :region, :size, :price, :shipping_days, :postage, :bland_id, :condition_id, :category_id, images_attributes: [:image, :_destroy, :id]).merge(user_id: current_user.id)
    # params.require(:product).permit(:id, :explanation, :name, :region, :size, :price, :shipping_days, :postage).merge(user_id: "3", condition_id: "1", category_id: "1", bland_id: "1")
  end
end
