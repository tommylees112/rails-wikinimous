class ArticlesController < ApplicationController

  before_action :find_article, only: [:show, :edit, :update, :destroy, :upvote, :downvote]

  def index
    @articles = Article.all
  end

  def show
  end

  def new
    @new_article = Article.new
  end

  def create
    new_article = Article.new(articles_params)
    new_article.save
    redirect_to articles_path
  end

  def edit
  end

  def update
    @article.update(articles_params)
    redirect_to articles_path
  end

  def destroy
    @article.destroy
    redirect_to articles_path
  end

  ## VOTERS
  def upvote
    @article.upvote
    redirect_to articles_path
  end

  def downvote
    @article.downvote
    redirect_to articles_path
  end

  ##########################
  private

  def find_article
    @article = Article.find(params[:id])
  end

  def articles_params
    params.require(:article).permit(:name, :content)
  end

end
