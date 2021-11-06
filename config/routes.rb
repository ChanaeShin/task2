Rails.application.routes.draw do
  
  get '/' => 'users#top'
  #get 'reservations/index'
  get  'rooms/index' 
  devise_for :users
  resources :rooms
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
 
  #resources :reservations
  
end
