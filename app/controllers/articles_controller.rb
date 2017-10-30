class ArticlesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_user, only: [:index, :show]
  before_action :set_current_user_article, only: [:edit, :update, :destroy]

  def index
    @articles = @user.articles
  end

  def show
    @article = @user.articles.find(params[:id])
  end

  def new
    @article = current_user.articles.build
  end

  def create
    @article = current_user.articles.build(article_params)
    if @article.save
      redirect_to @article
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @article.update(article_params)
      redirect_to [current_user, @article]
    else
      redner :edit
    end
  end

  def destroy
    @article.destroy
  end

  private

  def set_user
    @user = User.find_by(screen_name: params[:user_screen_name])
  end

  def article_params
    params.require(:article).permit(:title, :content)
  end

  def set_current_user_article
    @article = current_user.articles.find(params[:id])
  end
end
