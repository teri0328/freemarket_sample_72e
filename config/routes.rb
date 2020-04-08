Rails.application.routes.draw do

  devise_for :users, controllers: {
    registrations: 'users/registrations',
  }
  devise_scope :user do
    get 'addresses', to: 'users/registrations#new_address'
    post 'addresses', to: 'users/registrations#create_address'
  end
  
  root "products#index"

  resources :card, only: [:new, :create, :show, :delete] do
    collection do
      post 'show', to: 'card#show'
    end
  end
  resources :products, only: [:index, :new, :create, :show] do
    collection do
      get "about"
      get "master"
      get 'authenticate'
      get 'telephone'
      get 'select'
      get 'registration'
      get 'result'
    end
  end
  resources :users, only: [:show]
end