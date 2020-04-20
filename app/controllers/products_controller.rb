class ProductsController < ApplicationController
  before_action :set_params, only: :create
  before_action :set_product, only: [:destroy_image, :edit, :update, :show, :destroy, :buy, :pay, :create_like, :destroy_like, :create_comment, :get_category_parent]
  before_action :authenticate_user!, except: [:index, :show, :search]
  require 'payjp'
  require 'date'
  
  def index
    @used_id = []
    @products = Product.includes(:images).order('created_at DESC')
    respond_to do |format|
      format.html
      format.json
    end
    @categorize = Product.where(category_id: 3).order('created_at DESC')
  end



  #商品出品画面
  def new
    @product = Product.new
    @product.images.new

    Category.where(ancestry: nil).each do |category|
      @category = category.id
    end
    # 以下、出品ページのカテゴリ選択欄のため
    @category_parent_array = ["---"]
    Category.where(ancestry: nil).each do |gen1|
      @category_parent_array << [gen1.name, gen1.id]
    end

    @brands = Bland.all
    @brand_array = [nil]
    @brands.each do |brand|
      @brand_array << [brand.name, brand.id]
    end
  end

  #商品保存機能
  def create
    @product = Product.new(set_params)
    binding.pry
    if @product.valid? && !@product.images.empty?
      @product.save
    else
      redirect_to new_product_path
    end
  end

  def show
    @user       = User.find(@product.user)
    if @product.bland != nil
      @bland      = Bland.find(@product.bland)
    end
    @condition  = Condition.find(@product.condition)
    @address    = Address.where(user_id: @product.user)
    @evaluation = Evaluation.where(user_id: @product.user)
    @images     = Image.where(product_id: @product.id)
    @comment    = Comment.new
    @comments   = Comment.where(product_id: @product.id)
    @likenum    = 0

    @category   = @product.category
    if @category.ancestry != nil
      @ancestry = @category.ancestry
    end
  end

  def edit
    # 以下、出品ページのカテゴリ選択欄のため
    Category.where(ancestry: nil).each do |category|
      @category = category.id
    end
    @category_parent_array = ["---"]
    Category.where(ancestry: nil).each do |gen1|
      @category_parent_array << [gen1.name, gen1.id]
    end
    @brands = Bland.all
    @brand_array = [nil]
    @brands.each do |brand|
      @brand_array << [brand.name, brand.id]
    end
    respond_to do |format|
      format.html
      format.json
    end
  end

  def update
    if @product.valid? && !@product.images.empty?
      @product.update(set_params)
    else
      redirect_to edit_product_path(@product)
    end
  end

  def destroy_image
    @images = params[:destroy_image]
    @images.each do |image|
      img = Image.find(image)
      img.destroy!
    end
    redirect_to product_path(@product)
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

  def get_category_parent
    @category_parents       = Category.where(ancestry: nil)
    @category_children      = nil
    @category_grandchildren = nil
    @category_child      = nil
    @category_grandchild = nil

    if @product.category.ancestry == nil
      @category_parent        = Category.find(@product.category.id)
      @category_children      = Category.find(@product.category.id).children
    elsif @product.category.ancestry.include?("/") == false
      @category_parent        = Category.find(@product.category.parent.id)
      @category_child         = Category.find(@product.category.id)
      @category_children      = Category.find_by(id: @product.category.parent.id).children
    else
      @category_parent        = Category.find(@product.category.parent.parent.id)
      @category_child         = Category.find(@product.category.parent.id)
      @category_grandchild    = Category.find(@product.category.id)
      @category_children      = Category.find_by(id: @product.category.parent.parent.id).children
      @category_grandchildren = Category.find_by(id: @product.category.parent.id).children
    end
  end

  # 親カテゴリーが選択された後に動くアクション
  def get_category_children
    #選択された親カテゴリーに紐付く子カテゴリー（配列）を取得
    @category_children = Category.find_by(name: "#{params[:parent_name]}", ancestry: nil).children
  end

  # 子カテゴリーが選択された後に動くアクション
  def get_category_grandchildren
    #選択された子カテゴリーに紐付く孫カテゴリーの配列を取得
    @category_grandchildren = Category.find("#{params[:child_id]}").children
  end


  private
  
  def set_product
    @product = Product.find(params[:id])
  end

  def set_params
    params.require(:product).permit(:explanation, :name, :region, :size, :price, :shipping_days, :postage,:bland_id, :condition_id, :category_id, images_attributes: [:image, :_destroy, :id] ).merge(user_id: current_user.id)
  end

end

