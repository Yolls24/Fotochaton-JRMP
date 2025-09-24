class CheckoutController < ApplicationController
  def create
    cart = session[:cart] || {}
    item_ids = cart.keys.reject(&:blank?)           # supprime les clés vides
    items = Item.find(item_ids)                     # utilise Item au lieu de Product

    line_items = items.map do |item|
      {
        price_data: {
          currency: "eur",
          unit_amount: (item.price * 100).to_i,
          product_data: {
            name: item.name,
            images: [item.image]                    # si tu utilises image string, sinon image_url
          }
        },
        quantity: cart[item.id.to_s]
      }
    end

    session_stripe = Stripe::Checkout::Session.create(
      payment_method_types: ["card"],
      line_items: line_items,
      mode: "payment",
      success_url: root_url + "success",
      cancel_url: root_url + "cancel"
    )

    redirect_to session_stripe.url, allow_other_host: true
  end
end
