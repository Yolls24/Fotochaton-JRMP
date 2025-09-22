class CheckoutController < ApplicationController
    def create
      cart = session[:cart] || {}
      products = Product.find(cart.keys)
  
      line_items = products.map do |product|
        {
          price_data: {
            currency: "eur",
            unit_amount: (product.price * 100).to_i,
            product_data: {
              name: product.name,
              images: [product.image_url]
            }
          },
          quantity: cart[product.id.to_s]
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
  