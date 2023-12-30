Rails.application.routes.draw do
  
  #route for when user submits signup form
  post 'user', to: "users#create"

end
