Rails.application.routes.draw do
  devise_for :users
  root 'users#index'
  
  resources :users

  resources :users, only: [] do
    resources :contacts, shallow: true
  end
end
