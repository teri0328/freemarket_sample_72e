class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :basic_auth, if: :production? 
  before_action :set_key
  before_action :set_contents
  
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:firstname, :lastname, :firstname_kana, :lastname_kana, :nickname, :birth_year, :birth_month, :birth_day, :tel_number])
  end

  private

  def set_key
    gon.payjp_key = ENV['KEY']
  end

  def production?
    Rails.env.production?
  end

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]
    end
  end

  def set_contents
    if user_signed_in?
      @contents      = []
      contents       = ["マイページ"               ,"お知らせ","やることリスト","いいね一覧"                       ,"出品する"       ,"下書き一覧","出品した商品-出品中","出品した商品-取引中","出品した商品〜売却済み","購入した商品-取引中","購入した商品-過去の取引","ニュース一覧","評価一覧","ガイド","お問い合わせ"]
      contents_links = [destroy_user_session_path,""       ,""            ,show_like_user_path(current_user),new_product_path,""        ,""                ,""                ,""                  ,""                ,""                   ,""          ,""       ,""     ,""          ]
      method         = [:delete                  ,""       ,""            ,:get                             ,:get            ,""        ,""                ,""                ,""                  ,""                ,""                   ,""          ,""       ,""     ,""          ]
      @settings      = ["プロフィール","発送元・お届け先変更","支払い方法","メール・パスワード","本人情報","電話番号の確認","ログアウト"]
      contents.each.with_index(0) do |content,i|
        @contents << {content: content, link: contents_links[i], method: method[i]}
      end
    end
  end
end
