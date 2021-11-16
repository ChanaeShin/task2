Rails.application.routes.draw do
  
  get '/' => 'users#top'
  #get 'reservations/index'
  get  'rooms/index' 
  get '/users/show/:id', to: 'users#show'
  resources :users, only: [:show] #←この場合だとuser/1で遷移したいが、deviceを使っているのでuser/sign_upなどもShowの対象になってしまうのでパスを一つ間に挟む必要がある↑
  devise_for :users

  resources :rooms
  resources :reservations
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
 
  #resources :reservations

  
end
