class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.create(comment_params)
    @comment.user = current_user
    @comment.save
    redirect_to article_path(@article)
  end 

  private
    def comment_params
      params.require(:comment).permit(
        :commenter, 
        :body, 
        :article_id, 
        :user_id
      )
    end 
end
