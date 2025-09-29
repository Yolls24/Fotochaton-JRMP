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

  namespace :admin do
    get "/", to: "dashboard#index", as: :dashboard

    # Route pour promouvoir un user en admin
    patch "/users/:id/make_admin", to: "users#make_admin", as: :make_admin_user
    # Retrograder un admin
    patch "/users/:id/remove_admin", to: "users#remove_admin", as: :remove_admin_user
  end

  # ------------------------------
  # Letter Opener Web (dev uniquement)
  # ------------------------------

  require "letter_opener_web" if Rails.env.development?

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end


