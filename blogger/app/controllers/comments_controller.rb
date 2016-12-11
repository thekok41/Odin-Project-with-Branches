class CommentsController < ApplicationController

  def create
    # comment_params is like a short-hand for the params hash for all attributes the comment has
    @comment = Comment.new(comment_params)
    @comment.article_id = params[:article_id]

    @comment.save
    # we dont create a new html page here, but we simply direct back to the article where the comment tied to.
    # just like when we call @article.comments - all the comments will show, we can do the same w @comment.article - the article for that comment will show
    redirect_to articles_path(@comment.article)
  end

  def comment_params
    params.require(:comment).permit(:author_name, :body)
  end
end
