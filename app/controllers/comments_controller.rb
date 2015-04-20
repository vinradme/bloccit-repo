class CommentsController < ApplicationController

  def create
    @post = Post.find(params[:post_id])
    @comment = current_user.comments.build(comment_params)
    @comment.post = @post
    @topic =  @post.topic
    authorize @comment
    if @comment.save
      flash[:notice] = "Comment was saved."
      redirect_to [@topic, @post, @comments]
    else
      flash[:error] = "There was an error saving the comment. Please try again."
      render "posts/show"
    end
  end

  private
  
  def comment_params
    params.require(:comment).permit(:body)
  end
end
