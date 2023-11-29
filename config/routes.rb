Rails.application.routes.draw do
devise_for :customers, controllers: {
  registrations: 'customers/registrations'
}

  # Defines the root path route ("/")
  root "products#index"
  resource :customer, only: [:show, :edit, :update]
  resources :customers, path: "customers".to_s.humanize.parameterize do
    resources :addresses
  end
  resources :orders, only: [:index, :show, :new, :create]
  resources :products
  resource :cart, only: [:show]
  resources :carts do
    member do
      patch 'update_quantity'
      delete 'destroy'
    end
  end
  resources :cart_items, only: [:create, :update, :destroy]
   post 'cart/add_to_cart/:product_id', to: 'cart#add_to_cart', as: 'add_to_cart'
end
