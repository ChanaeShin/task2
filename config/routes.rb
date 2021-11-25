Rails.application.routes.draw do
  
  get 'top/top'
  root 'top#top'
  get 'users/account'
  get 'users/profile' , to: 'users#profile'
  patch 'users/update', to: 'users#update'
  devise_for :users

  resources :reservations
  
  get 'rooms/posts' , to: 'rooms#posts'
  get 'rooms/search', to: 'rooms#search'
  resources :rooms

end
