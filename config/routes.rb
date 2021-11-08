Rails.application.routes.draw do
  
  get '/' => 'users#top'
  #get 'reservations/index'
  get  'rooms/index' 
  
  resources :users, only: [:show]
  devise_for :users, controllers: {
        registrations: 'users/registrations'
  }


  resources :rooms
  resources :reservations
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
 
  #resources :reservations
  
end
