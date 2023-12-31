Rails.application.routes.draw do
  
  #route for when user signs up and logs in
  resources :users, only: [:create]
  post 'login', to: 'users#login'

  #routes for CRUD actions related to posts and comments
  resources :posts, :except => [:new] do
    resources :comments, :except => [:new, :show]
  end

  #routes for finding tags
  get 'tags', to: 'tags#index'

end
