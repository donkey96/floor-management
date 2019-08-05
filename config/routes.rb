Rails.application.routes.draw do
  devise_for :users
  root to: 'tables#index'
  resources :tables, only: [:new, :create, :destroy]
  resources :customers, only: [:index, :new, :create]
  resources :customers_tables, only: [:destroy]
end
