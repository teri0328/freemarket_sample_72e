class UsersController < ApplicationController
  before_action :set_user, only: [:show, :show_like]

  def show
    @contents      = []
    contents       = ["マイページ","お知らせ","やることリスト","いいね一覧"                       ,"出品する","下書き一覧","出品した商品-出品中","出品した商品-取引中","出品した商品〜売却済み","購入した商品-取引中","購入した商品-過去の取引","ニュース一覧","評価一覧","ガイド","お問い合わせ"]
    contents_links = [""        ,""       ,""            ,show_like_user_path(current_user),""       ,""        ,""                ,""                ,""                  ,""                ,""                   ,""          ,""       ,""     ,""          ]
    @settings      = ["プロフィール","発送元・お届け先変更","支払い方法","メール・パスワード","本人情報","電話番号の確認","ログアウト"]
    contents.each.with_index(0) do |content,i|
      @contents << {content: content, link: contents_links[i]}
    end
  end

  def show_like
    @products = Product.all
  end

  private
  
  def set_user
    @user = User.find(params[:id])
  end

end