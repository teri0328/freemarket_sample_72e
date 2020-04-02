class UsersController < ApplicationController

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

end
