# app/controllers/checkouts_controller.rb
class CheckoutsController < ApplicationController
  before_action :authenticate_user!

  def create
    # ⚠️ Assure-toi que ta clé Stripe est dans .env
    Stripe.api_key = ENV['STRIPE_SECRET_KEY']

    # On récupère le panier depuis la session
    cart = session[:cart] || {}
    if cart.empty?
      redirect_to cart_path, alert: "Votre panier est vide 😿"
      return
    end

    # Préparation des items Stripe à partir de session[:cart]
    line_items = cart.map do |item_id, quantity|
      item = Item.find(item_id)
      {
        price_data: {
          currency: "eur",
          product_data: { name: item.name },
          unit_amount: (item.price * 100).to_i # prix en centimes
        },
        quantity: quantity
      }
    end

    # Création de la session Stripe
    session_stripe = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      line_items: line_items,
      mode: 'payment',
      success_url: root_url + "?success=true",
      cancel_url: cart_url + "?canceled=true"
    )

    # Redirection vers Stripe Checkout
    redirect_to session_stripe.url, allow_other_host: true
  rescue Stripe::StripeError => e
    # Gestion des erreurs Stripe
    redirect_to cart_path, alert: "Erreur Stripe : #{e.message}"
  end
end












