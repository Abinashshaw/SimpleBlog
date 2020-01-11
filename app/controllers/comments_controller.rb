class CommentsController < ApplicationController
  http_basic_authenticate_with name: "krsna", password: "radhe", only: :destroy

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(comment_params)
    if @comment.save
      flash[:notice] = "Comment is created successfully"
      redirect_to post_path(@post)
    else
      flash[:notice] = "Comment is failed to be saved"
      redirect_to post_path(@post)
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    if @comment.destroy
      flash[:notice] = "Comment is successfully destroyed"
      redirect_to post_path(@post)
    end
  end

  private
    def comment_params
      params.require(:comment).permit(:username, :body)
    end
end
