class UsersController < ApplicationController
  before_action :set_user, only: [:show, :show_like]

  def show
  end

  def show_like
    @products = Product.all
  end

  private
  
  def set_user
    @user = User.find(params[:id])
  end

end