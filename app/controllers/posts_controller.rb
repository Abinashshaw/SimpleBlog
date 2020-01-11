class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  
  http_basic_authenticate_with name: "krsna", password: "radhe", except: [:index, :show]

  def index
    @posts = Post.all
  end

  def show
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(posts_params)
    if @post.save
      flash[:notice] = "Post is successfully created"
      redirect_to post_path(@post)
    else
      flash.now[:notice] = "Post is failed to be created"
      render "new"
    end
  end

  def edit
  end

  def update
    if @post.update(posts_params)
      flash[:notice] = "Post is successfully updated"
      redirect_to post_path(@post)
    else
      flash.now[:notice] = "Post is failed to be updated"
      render "edit"
    end
  end

  def destroy
    @post.destroy
    flash[:notice] = "Post is successfully deleted"
    redirect_to posts_path
  end

  private
    def set_post
      @post = Post.find(params[:id])
    end

    def posts_params
      params.require(:post).permit(:text, :title)
    end
end
