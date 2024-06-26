class User::PostCommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    comment = current_customer.post_comments.new(post_comment_params)
    comment.post_id = @post.id
    comment.save
  end

  def destroy
    comment = PostComment.find(params[:id])
    
    @user_post = comment.post
    
    comment.destroy
  end

  private

  def post_comment_params
    params.require(:post_comment).permit(:comment)
  end
end
