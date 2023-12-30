Rails.application.routes.draw do
  
  #route for when user submits signup form
  post 'users', to: 'users#create'

  #routes for creating and viewing posts
  resources :posts, :except => [:new]

  #routes for finding tags
  get 'tags', to: 'tags#index'
  
end
