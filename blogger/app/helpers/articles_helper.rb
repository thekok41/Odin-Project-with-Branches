module ArticlesHelper
  # this support  strong params
  def article_params
    # params.require(:article).permit(:title, :body)
    params.require(:article).permit(:title, :body, :tag_list, :image)
  end
end
