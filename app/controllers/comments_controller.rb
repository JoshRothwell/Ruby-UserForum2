class CommentsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :destroy]

  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.build(comment_params.merge(user_id: current_user.id))
    
    if @comment.save
      redirect_to article_path(@article)
    else
      render 'articles/show'
    end
  end
  
  
  def destroy
    @comment = Comment.find(params[:id])
  
    if can_delete_comment?(@comment)
      article = @comment.article # Store a reference to the associated article
      @comment.destroy
      flash[:notice] = "Comment deleted successfully."
      redirect_to article_path(article) # Use the stored article reference
    else
      flash[:alert] = "You are not authorized to delete this comment."
      redirect_to root_path
    end
  end
  
  
  
  
  
  

  private
  
  def can_delete_comment?(comment)
    current_user.admin? || comment.user == current_user
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :status).merge(user_id: current_user.id)
  end
end
