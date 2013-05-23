Median::Application.routes.draw do
  get "searches/new"

  resources :users
  resources :categories
  resources :posts do
  	resource :like #this makes it: post/1/like/new
    resources :user_comments #, path: "comments" (to make the url 'comments' instead of 'user_comments')
  end

  #Single resource
  resource :session
  resource :account
  resource :search

  root to: "posts#index"

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

end
