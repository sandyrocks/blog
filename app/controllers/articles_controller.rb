class ArticlesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_article, only: [:show, :edit, :update]

  rescue_from ActiveRecord::RecordNotFound, with: :invalid_article 

  def index
    @articles = Article.all
  end

  def show
  end

  def new
    @article = Article.new
  end

  def create
    @article = current_user.articles.new(article_params)
    if @article.save 
      respond_to do |format|
        format.html { redirect_to article_path(@article), info: 'Article created successfully.'}
        format.js if request.xhr?
      end 
    else
      render 'new'
    end 
  end

  def edit
  end

  def update
    if @article.update(article_params)
      respond_to do |format| 
        format.html { redirect_to article_path(@article), info: 'Article updated successfully.'}
      end 
    else
      render 'edit'
    end 
  end

  def destroy 
    if @article.destroy
      redirect_to articles_path, info: 'Article deleted successfully'
    end
  end 

  private
    def set_article
      @article = Article.find(params[:id])
    end 

    def article_params
      params.require(:article).permit(:title, :description, :category_id)
    end 

    def invalid_article
      redirect_to articles_path, danger: "Aritcle Not Found with Id : #{params[:id]}"
    end
end
