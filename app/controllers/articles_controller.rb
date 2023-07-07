class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  def index
    if params[:query].present?
      @query = params[:query]
      @articles = Article.where("title LIKE ?", "%#{@query}%")
    else
      @articles = Article.all
    end
  end


  def set_article
    @article = Article.find(params[:id])
  end

  def show
    if @article.status == 'private' && !current_user&.admin?
      redirect_to articles_path, notice: 'This article is private and cannot be accessed.'
    elsif @article.status == 'archived' && !current_user&.admin?
      redirect_to articles_path, notice: 'This article is archived and cannot be accessed.'
    
    else
      # Show the article
    end
  end

  def new
    @article = current_user.articles.build
  end

  def create
    @article = current_user.articles.build(article_params)
    if @article.save
      redirect_to @article, notice: 'Article was successfully created.'
    else
      puts @article.errors.full_messages.inspect
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @article = Article.find(params[:id])
    unless current_user.admin? || @article.user == current_user
      redirect_to root_path, notice: "You don't have permission to edit this article."
    end
  end
  
  
  


  def update
    @article = Article.find(params[:id])
    authorize_edit(@article)
  
    if @article.update(article_params)
      redirect_to @article
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def search
    @query = params[:query]
    @articles = Article.where("title LIKE ?", "%#{@query}%")
  end
  

  def destroy
    @article = Article.find(params[:id])
  
    begin
      ActiveRecord::Base.transaction do
        puts "Deleting comments..."
        @article.comments.delete_all # Delete all comments associated with the article
  
        puts "Deleting article..."
        @article.destroy! # Delete the article
      end
      redirect_to articles_path, notice: "Article and associated comments successfully deleted."
    rescue ActiveRecord::RecordNotDestroyed => e
      redirect_to article_path(@article), alert: "Failed to delete the article and associated comments."
    end
  end
  
  
  private

  

  def authorize_edit(article)
    unless current_user.admin? || article.user == current_user
      redirect_to articles_path, notice: 'You do not have permission to edit this article.'
    end
  end

  def authorize_delete(article)
    unless current_user.admin? || article.user == current_user
      redirect_to articles_path, notice: 'You do not have permission to delete this article.'
    end
  end
  

  def article_params
    params.require(:article).permit(:title, :body, :status)
  end
end
