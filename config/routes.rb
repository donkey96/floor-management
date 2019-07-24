Rails.application.routes.draw do
  devise_for :users
  root to: 'tables#index'
  resources :tables, only: [:new, :create]
end
