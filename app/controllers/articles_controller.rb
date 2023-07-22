class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  # GET /articles
  def index
    if params[:query].present?
      @query = params[:query]
      @articles = Article.where("title LIKE ?", "%#{@query}%")
    else
      @articles = Article.all
    end
  end

  # Finds the article based on the provided ID
  def set_article
    @article = Article.find(params[:id])
  end

  # GET /articles/:id
  def show
    if @article.status == 'private' && !current_user&.admin?
      redirect_to articles_path, notice: 'This article is private and cannot be accessed.'
    elsif @article.status == 'archived' && !current_user&.admin?
      redirect_to articles_path, notice: 'This article is archived and cannot be accessed.'
    else
      # Show the article
    end
  end

  # GET /articles/new
  def new
    @article = current_user.articles.build
  end

  # POST /articles
# POST /articles
def create
  @article = current_user.articles.build(article_params)
  if @article.save
    # Log the information using the Singleton logger
    my_logger = MyLogger.instance
    log_message = "A new article has been created: " + @article.title
    my_logger.logInformation(log_message)

    redirect_to @article, notice: 'Article was successfully created.'
  else
    puts @article.errors.full_messages.inspect
    render :new, status: :unprocessable_entity
  end
end


  # GET /articles/:id/edit
  def edit
    @article = Article.find(params[:id])
    unless current_user.admin? || @article.user == current_user
      redirect_to root_path, notice: "You don't have permission to edit this article."
    end
  end

  # PATCH /articles/:id
  def update
    @article = Article.find(params[:id])
    authorize_edit(@article)

    if @article.update(article_params)
      redirect_to @article
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # Custom search action
  def search
    @query = params[:query]
    @articles = Article.where("title LIKE ?", "%#{@query}%")
  end

  # DELETE /articles/:id
  def destroy
    @article = Article.find(params[:id])

    begin
      ActiveRecord::Base.transaction do
        puts "Deleting comments..."
        @article.comments.delete_all # Delete all comments associated with the article

        puts "Deleting article..."
        @article.destroy! # Delete the article
      end

      # Log the information using the Singleton logger
      my_logger = MyLogger.instance
      log_message = "The following article has been deleted: " + @article.title
      my_logger.logInformation(log_message)

      redirect_to articles_path, notice: "Article and associated comments successfully deleted."
    rescue ActiveRecord::RecordNotDestroyed => e
      redirect_to article_path(@article), alert: "Failed to delete the article and associated comments."
    end
  end

  private

  # Checks if the current user has permission to edit the article
  def authorize_edit(article)
    unless current_user.admin? || article.user == current_user
      redirect_to articles_path, notice: 'You do not have permission to edit this article.'
    end
  end

  # Checks if the current user has permission to delete the article
  def authorize_delete(article)
    unless current_user.admin? || article.user == current_user
      redirect_to articles_path, notice: 'You do not have permission to delete this article.'
    end
  end

  # Strong parameters for article creation and update
  def article_params
    params.require(:article).permit(:title, :body, :status)
  end
end

