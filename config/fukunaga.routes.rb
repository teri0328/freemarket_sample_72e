Rails.application.routes.draw do
  root "products#index"
  resources :products do
    collection do
      get 'authenticate'
      get 'telephone'
      get 'select'
      get 'registration'
      get 'result'
    end
  end
end
