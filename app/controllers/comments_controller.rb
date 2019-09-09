class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    @comment = current_user.comments.new(comment_params)
    @comment.topic_id = comment_params[:topic_id]
    if @comment.save
      redirect_to topics_path, success: 'コメントに成功しました'
    else
      flash.now[:danger] = "コメントに失敗しました"
      render :new
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:comment, :topic_id)
  end
end
