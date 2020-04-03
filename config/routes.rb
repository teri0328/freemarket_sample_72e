Rails.application.routes.draw do
  devise_for :users
  root "products#master"
  resources :products, only: [:index,:new] do
    collection do
      get "buy"
      get "about"
      get "master"
    end
  end
  resources :users, only: [:index]
end