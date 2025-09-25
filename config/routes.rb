Rails.application.routes.draw do
  get "home/index"
  # Authentification
  devise_for :users

  resources :categories, only: [:show]

  # Produits
  resources :products, only: [:index, :show]

  # Panier
  get "cart", to: "cart#show", as: "cart"
  post   "cart/add/:item_id",    to: "cart#add",    as: "cart_add"
  delete "cart/remove/:item_id", to: "cart#remove", as: "cart_remove"

  # Paiement Stripe
  post "checkout/create", to: "checkouts#create", as: "checkout_create"

  # Page d’accueil = liste produits
  root "home#index"

  resource :checkout, only: [:show, :create]
  get 'payments/success', to: 'payments#success'
  get 'payments/cancel', to: 'payments#cancel'

end


