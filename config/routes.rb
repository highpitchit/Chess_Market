Rails.application.routes.draw do
  


  get 'splashes/home'
  get '/pages/index'
  get '/pages/show', to: "pages#show"
  #get '/users/:user_id', to: "users#show", as: "profile"
  # patch '/users/:id', to: "users#update"
  
  # get 'pages/new'
  # get 'pages/edit'
  # get 'pages/create'
  # get 'pages/update'
  # get 'pages/destroy'
  
  resources :forums do
    post '/comments', to: "comments#create"
    patch '/comments/:comment_id', to: "comments#update"
    get '/comments/:comment_id', to: "comments#show"
    delete '/comments/:comment_id', to: "comments#destroy"
  end
 
  resources :advertises 
  devise_for :users
  resources :users
  root to: "splashes#home"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
