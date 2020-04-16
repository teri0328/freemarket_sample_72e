Rails.application.routes.draw do
  $date = Date.today.to_s + Time.now.to_s

  devise_for :users, controllers: {
    registrations: 'users/registrations',
  }
  devise_scope :user do
    get 'addresses', to: 'users/registrations#new_address'
    post 'addresses', to: 'users/registrations#create_address'
  end
  
  root "products#index"

  resources :card, only: [:new, :create, :show, :destroy] do
    collection do
      post 'show', to: 'card#show'
    end
  end

  resources :products, only: [:index, :new, :create, :show, :destroy] do
    collection do
      get "search"
      get 'get_category_children', defaults: {format: 'json'}
      get 'get_category_grandchildren', defaults: { format: 'json' }
    end
    member do
      get "pay"
      get "buy"
      get "create_like"
      post "create_comment"
      delete "destroy_like"
    end
  end

  resources :users, only: [:show] do
    member do
      get "show_like"
      get 'authenticate'
      get 'telephone'
      get 'select'
      get 'registration'
      get 'result'
    end
  end
end