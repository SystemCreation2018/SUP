class CommentsController < ApplicationController
  before_action :set_comment, only: [:destroy]
  
  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.build(comment_params)
    
    if @comment.save
      redirect_to article_path(@article)
    else
      render "articles/show"
    end
  end
  
  def destroy
    @comment.destroy
    redirect_to request.referrer || root_url
  end
  
  private
    def set_comment
      @comment = Comment.find(params[:id])
    end
  
    def comment_params
      params.require(:comment).permit(:body)
    end
end