Blogger::Application.routes.draw do
  root 'drinks#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # when browser receives a request, it will go to the router first to decide what the request is trying to do or interact with

  # the "resources" tells Rails that we have a resource named "articles" and the router should expect the request to follow RESTful (REpresentational State Transfer) model of the web interaction. For ex, when you make a request like http://localhost:3000/articles/, the router will understand you’re looking for a listing of the articles, and http://localhost:3000/articles/new means you’re trying to create a new article.

  # this is to set the starter page at http://localhost:3000/
  root to: 'articles#index'
  # if we comment out this line, the Terminal will say: "You don't have any routes defined!""
  resources :articles do
    resources :comments
  end
  resources :tags

end
