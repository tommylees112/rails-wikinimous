class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
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
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    @article.update(articles_params)
    redirect_to articles_path
  end

  def destroy
    article_to_delete = Article.find(params[:id])
    article_to_delete.destroy
    redirect_to articles_path
  end

  ##########################
  private

  def articles_params
    params.require(:article).permit(:name, :content)
  end

end
