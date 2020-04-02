class UsersController < ApplicationController
  
  def index
    @contents = ["マイページ","お知らせ","やることリスト","いいね！一覧","出品する","下書き一覧","出品した商品-出品中","出品した商品-取引中","出品した商品-売却済み","購入した商品-取引中","購入した商品-過去の取引","ニュース一覧","評価一覧","ガイド","お問い合わせ","追加項目1","追加項目2","追加項目3"]
  end

  def new
  end

  def create
  end


end