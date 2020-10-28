class PostsController < ApplicationController
  before_action :authenticate_user!, only: %i[new create destroy]
  before_action :ensure_current_user, only: %i[edit update]
  before_action :correct_user, only: :destroy

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:notice] = "投稿しました"
      redirect_to posts_url
    else
      render :new
    end
  end

  def show
    @post = Post.find_by(id: params[:id])
  end

  def edit
    @post = Post.find_by(id: params[:id])
  end

  def update
    @post = Post.find_by(id: params[:id])
    if @post.update(post_params)
      flash[:notice] = "投稿を編集しました"
      redirect_to posts_path
    else
      render :edit
    end
  end

  def destroy
    @post.destroy
    flash[:notice] = "投稿を削除しました"
    redirect_to posts_url
  end

  private

  def post_params
    params.require(:post).permit(:content, :title)
  end

  def ensure_current_user
    post = Post.find(params[:id])
    if post.user_id != current_user.id
      redirect_to action: :index
    end
  end

end
