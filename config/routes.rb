Rails.application.routes.draw do
  devise_for :users
  root 'territories#index'

  resources :territories, only: :index do
    resources :users, shallow: true
  end

  resources :users, only: [] do
    resources :contacts
  end

  # routes for territory
  # nested routes for users under territory
  # nested routes for contacts under user
end
