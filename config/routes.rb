Rails.application.routes.draw do
  get "home/index"
  # Authentification
  devise_for :users

  # Produits
  resources :products, only: [:index, :show]

  # Panier
  get "cart", to: "cart#show", as: "cart"
  post "cart/add/:id", to: "cart#add", as: "cart_add"
  delete "cart/remove/:id", to: "cart#remove", as: "remove_cart"

  # Paiement Stripe
  post "checkout/create", to: "checkout#create", as: "checkout_create"

  # Page d’accueil = liste produits
  root "home#index"
end

