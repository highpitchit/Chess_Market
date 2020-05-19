Rails.application.routes.draw do
  
  get 'splashes/home'
  get 'splashes/chess'

  resources :forums do
    post '/comments', to: "comments#create"
    # patch '/comments/:comment_id', to: "comments#update"
    # get '/comments/:comment_id', to: "comments#show"
    delete '/comments/:comment_id', to: "comments#destroy"
  end
 
  resources :advertises 
  devise_for :users
  resources :users
  root to: "splashes#home"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
