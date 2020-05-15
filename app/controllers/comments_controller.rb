class CommentsController < ApplicationController
  def new
    @post = Post.find(params[:post_id])
    @comment = Comment.new
  end
  
  def create
    @comment = Comment.create(set_params)
    @post = Post.find(params[:post_id])
    @comment.post = @post
    @comment.user = current_user
    if @comment.save
      redirect_to post_path(@post)
    else
      render :new
    end
  end

  def destroy
  end

  private

  def set_params
    params.require(:comment).permit(:content)
  end
end
