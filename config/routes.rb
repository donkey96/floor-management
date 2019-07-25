Rails.application.routes.draw do
  devise_for :users
  root to: 'tables#index'
  resources :tables, only: [:new, :create]
  resources :customers, only: [:index, :new, :create]
end
