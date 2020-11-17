class UsersController < ApplicationController
  before_action :authenticate_user!, only: %i[show destroy]
  before_action :admin_user,     only: %i[index]

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @my_posts = @user.posts
    @followings = @user.following
    @followers = @user.followers
    @liked_posts = @user.liked_posts
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:notice] = "ユーザー「#{@user.name}」を削除しました"
    redirect_to users_url
  end

  private
  # 管理者かどうか確認
  def admin_user
    redirect_to(root_url) unless current_user.admin?
  end

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
