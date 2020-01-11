class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
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
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(posts_params)
      flash[:notice] = "Post is successfully updated"
      redirect_to post_path(@post)
    else
      flash.now[:notice] = "Post is failed to be updated"
      render "edit"
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    flash[:notice] = "Post is successfully deleted"
    redirect_to posts_path
  end

  private
    def posts_params
      params.require(:post).permit(:text, :title)
    end
end
