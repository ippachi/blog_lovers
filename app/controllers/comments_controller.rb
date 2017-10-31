class CommentsController < ApplicationController
  def create
    @comment = current_user.comments.build(comment_params)
    if @comment.save
      redirect_to :back
    else
      redirect_to :back
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :article_id)
  end
end
