class CommentsController < ApplicationController
  before_action :authenticate_user!, only: :create

  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.build(comment_params)
    @comment.user = current_user
  
    if @comment.save
      redirect_to article_path(@article)
    else
      render 'articles/show' # or any other appropriate view
    end
  end
  
  def destroy
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
  
    if @comment.destroy
      redirect_to article_path(@article), notice: 'Comment successfully deleted.'
    else
      redirect_to article_path(@article), alert: 'Failed to delete the comment.'
    end
  end
  
  

  private

def comment_params
  params.require(:comment).permit(:body, :status).merge(user_id: current_user.id)
end
end
