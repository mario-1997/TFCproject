Rails.application.routes.draw do
  devise_for :users
    get '/home', to: 'home#index'
    
    resources :groups #me hace el CRUD entero
    resources :concerts 
    resources :members
    resources :albums
    resources :songs
end
