Rails.application.routes.draw do
  root to: 'homes#top'
  get'home/about' =>'homes#about'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :books
  resources :users, only: [:index,:edit ,:show, :update, :destroy]
end
