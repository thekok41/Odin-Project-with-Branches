class ArticlesController < ApplicationController
  #When user click on the title, the browser will be directed to this URL: http://localhost:3000/articles/1. We use the number on the end of the URL to find the article in the database.
  # "find" is a class method. params[:id] is the key
  include ArticlesHelper
  def index
    # instance var: we want the list of articles to be accessible from both the controller and the view
    # in Rails' controller, there's a hack which allows instance var to be automatically transferred from the controller to the object which renders in the view template
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
    # if we use @comment = @article.comments.new here, it will create an extra "Comment by" line. The reason is @article.comments.new has added the new Comment to the in-memory collection for the Article
    @comment = Comment.new
    # @comment = @article.comments.new
    # Due to the Rails’ mass-assignment protection, the article_id attribute of the new Comment object needs to be manually assigned with the id of the Article
    @comment.article_id = @article.id
  end

  def new
    @article = Article.new
  end

  def create
    # when you call a new article, you can pass it a hash of attributes
    # article.params is like the short-hand for params hash for all attributes the article has
    @article = Article.new(article_params)
    # @article = Article.new(params[:article])
    # params can take a hash inside a hash
    # title: params[:article][:title]
    # body: params[:article][:body]
    @article.save
    # we dont create a new html page here, but we simply direct the create page to the previous show page (since it has article_path(id), which is the "show" action in route)
    redirect_to article_path(@article)
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to articles_path
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    # article_params bacuase we need to update every field of the object
    @article.update(article_params)
    flash.notice = "Article '#{@article.title}' has been updated!"
    redirect_to article_path(@article)
  end

end
