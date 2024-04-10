class ArticlesController < ApplicationController
  # GET /articles or /articles.json
  def index
    @articles = Article.all.where(visible: true).order(created_at: :desc)
  end

  # GET /articles/1 or /articles/1.json
  def show
    @article = Article.find(params[:id])

    redirect_to articles_url if @article.visible == false
  end
end
