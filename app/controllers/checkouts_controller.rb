class CheckoutsController < ApplicationController
  before_action :authenticate_user!

  def create
    Stripe.api_key = ENV['STRIPE_SECRET_KEY']

    cart = session[:cart] || {}
    if cart.empty?
      redirect_to cart_path, alert: "Votre panier est vide 😿"
      return
    end

    line_items = cart.map do |item_id, quantity|
      item = Item.find(item_id)
      {
        price_data: {
          currency: "eur",
          product_data: { name: item.name },
          unit_amount: (item.price * 100).to_i
        },
        quantity: quantity
      }
    end

    session_stripe = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      line_items: line_items,
      mode: 'payment',
      success_url: payments_success_url,
      cancel_url: payments_cancel_url
    )

    redirect_to session_stripe.url, allow_other_host: true
  rescue Stripe::StripeError => e
    redirect_to cart_path, alert: "Erreur Stripe : #{e.message}"
  end
end













