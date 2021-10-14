Rails.application.routes.draw do

  as :user do
      root to: "devise/sessions#new"
    end

  #root to: 'registrations#new'
  #get '/home', to: 'home#index'
  
  resources :groups #me hace el CRUD entero
  resources :concerts 
  resources :members
  resources :albums
  resources :songs

  devise_for :users


  


  
        
    
end

