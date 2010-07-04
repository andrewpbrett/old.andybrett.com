class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(params[:comment])
    CommentsNotifier.deliver_comment_notification(@post.title, @comment.text, @comment.name)
    redirect_to @post
  end
end
