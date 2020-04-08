Rails.application.routes.draw do
  devise_for :users
  root "products#master"
  resources :products do
    collection do
      get "buy"
      get "about"
      get "master"
    end
  end
  resources :users, only: [:index] do
    collection do
      get "card"
      post "pay"
      get "pay"
    end  
  end
end