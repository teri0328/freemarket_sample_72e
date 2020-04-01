Rails.application.routes.draw do
  devise_for :users
  root "products#index"
  resources :products, only: [:index,:new] do
    collection do
      get "buy"
    end
  end
  resources :users, only: [:index] do
    collection do
      get "about"
    end
  end
end