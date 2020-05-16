Rails.application.routes.draw do
  


  get 'pages/index'
  get 'pages/show'
  get 'pages/new'
  get 'pages/edit'
  get 'pages/create'
  get 'pages/update'
  get 'pages/destroy'
  resources :advertises do
 
  end
  resources :forums do
    post '/comments', to: "comments#create"
    patch '/comments/:comment_id', to: "comments#update"
    get '/comments/:comment_id', to: "comments#show"
    delete '/comments/:comment_id', to: "comments#destroy"
  end
 
  devise_for :users
  resources :users
  root to: "users#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
