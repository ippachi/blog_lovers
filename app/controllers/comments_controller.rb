class CommentsController < ApplicationController
  before_action :set_user
  before_action :set_article
  def create
    @comment = current_user.comments.build(comment_params)
    respond_to do |format|
      if @comment.save
        format.html
        format.js { @comments = Article.find(params[:article_id]).comments }
      else
        format.html { redirect_to user_article_url(@user, @article) }
      end
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :article_id)
  end

  def set_user
    @user = User.find_by(screen_name: params[:user_screen_name])
  end

  def set_article
    @article = @user.articles.find(params[:article_id])
  end
end
