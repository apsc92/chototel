Rails.application.routes.draw do
  devise_for :users
  root 'territories#index'

  resources :territories, only: :index do
    resources :users, shallow: true
  end

  resources :users, only: [] do
    resources :contacts, shallow: true
  end
end
