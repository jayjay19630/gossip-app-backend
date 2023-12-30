Rails.application.routes.draw do
  
  #route for when user submits signup form
  post 'users', to: 'users#create'

  #routes for creating and viewing posts
  resources :posts, :except => [:new]

end
