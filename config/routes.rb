Rails.application.routes.draw do
  devise_for :users
  root "products#master"
  resources :products do
    collection do
      get "buy"
      get "about"
      get "master"

      get 'authenticate'
      get 'telephone'
      get 'select'
      get 'registration'
      get 'result'
    end
  end
  resources :users, only: [:index]
end