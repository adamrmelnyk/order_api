Rails.application.routes.draw do
  resources :products, only: [:index]
  resources :customers, only: [:orders] do
    member do
      get :orders
    end
  end
end
