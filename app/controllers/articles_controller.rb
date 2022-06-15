class ArticlesController < ApplicationController
  def show
    @article = Article.find(params[:id])
    @paragraphs = @article.paragraphs
  end
end