Rails.application.routes.draw do
  resources :products, only: [:index]
  resources :customers do
    member do
      get :orders
    end
  end
end
