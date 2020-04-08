class UsersController < ApplicationController
  require "payjp"

  def index
    @contents = ["マイページ","お知らせ","やることリスト","いいね一覧","出品する","下書き一覧","出品した商品-出品中","出品した商品-取引中","出品した商品〜売却済み","購入した商品-取引中","購入した商品-過去の取引","ニュース一覧","評価一覧","ガイド","お問い合わせ"]
    @settings = ["プロフィール","発送元・お届け先変更","支払い方法","メール・パスワード","本人情報","電話番号の確認","ログアウト"]
  end

  def new
  end

  def create
  end

  def about
  end

  def card
    @contents = ["マイページ","お知らせ","やることリスト","いいね一覧","出品する","下書き一覧","出品した商品-出品中","出品した商品-取引中","出品した商品〜売却済み","購入した商品-取引中","購入した商品-過去の取引","ニュース一覧","評価一覧","ガイド","お問い合わせ"]
    @settings = ["プロフィール","発送元・お届け先変更","支払い方法","メール・パスワード","本人情報","電話番号の確認","ログアウト"]
    Payjp.api_key = "sk_test_e5b183e9e49375f13a25f72c"
    @user = User.new
    if params[:payjp_Token].blank?
      redirect_to action: "index"
    else
      # 顧客情報をPAY.JPに登録。
      customer = Payjp::Customer.create(
        description: 'test', 
        email: @user.email,
        card: params[:payjp_Token], 
      )
    end

  end

  def post
  end

  def pay
    @contents = ["マイページ","お知らせ","やることリスト","いいね一覧","出品する","下書き一覧","出品した商品-出品中","出品した商品-取引中","出品した商品〜売却済み","購入した商品-取引中","購入した商品-過去の取引","ニュース一覧","評価一覧","ガイド","お問い合わせ"]
    @settings = ["プロフィール","発送元・お届け先変更","支払い方法","メール・パスワード","本人情報","電話番号の確認","ログアウト"]
    
    Payjp.api_key = "sk_test_e5b183e9e49375f13a25f72c"
    @customer = Payjp::Customer.create(card: params[:payjp_token])
    @customer_year = params[:exp_year]
    @customer_number = params[:number]
    @customer_month = params[:exp_month]
    


  
  end
  #   Payjp.api_key = "pk_test_987ff3dd7d5519b4992219fc"
  #   customer = Payjp::Customer.retrieve(@creditcard.customer_id)
  #   @creditcard_information = customer.cards.retrieve(@creditcard.card_id)
  #   @card_brand = @creditcard_information.brand 
  #   case @card_brand
  #   when "Visa"
  #     @card_src = "visa.svg"
  #   when "JCB"
  #     @card_src = "jcb.svg"
  #   when "MasterCard"
  #     @card_src = "master-card.svg"
  #   when "American Express"
  #     @card_src = "american_express.svg"
  #   when "Diners Club"
  #     @card_src = "dinersclub.svg"
  #   when "Discover"
  #     @card_src = "discover.svg"
  #   end
  
end