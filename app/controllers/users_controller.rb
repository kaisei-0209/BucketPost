class UsersController < ApplicationController
  before_action :authenticate_user!, only: %i[index destroy]
  # before_action :admin_user,     only: :destroy

  def index
    @posts = Post.all
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts
    @followings = @user.following
    @followers = @user.followers
  end

  # private
  #  # 管理者かどうか確認
  #  def admin_user
  #   redirect_to(root_url) unless current_user.admin?
  # end

  # フォローしているユーザー一覧
  def following
    @user  = User.find(params[:id])
    @users = @user.following
    #render 'show_follow'
  end

  # フォローされているユーザー一覧
  def followers
    @user  = User.find(params[:id])
    @users = @user.followers
    #render 'show_follower'
  end

end
