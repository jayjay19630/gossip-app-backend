Rails.application.routes.draw do
  
  #route for when user submits signup form
  post 'users', to: 'users#create'

  #routes for CRUD actions related to posts and comments
  resources :posts, :except => [:new] do
    resources :comments, :except => [:new, :show]
  end

  #routes for finding tags
  get 'tags', to: 'tags#index'

end
