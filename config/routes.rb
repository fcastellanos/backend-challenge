Rails.application.routes.draw do
  devise_for :users
  
  resources :users, only: [:show]
  
  post 'search/show'
  
  root to: "home#index"
end
