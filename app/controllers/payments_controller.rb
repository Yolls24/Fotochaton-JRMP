# app/controllers/payments_controller.rb
class PaymentsController < ApplicationController
  before_action :authenticate_user!

  def success
    cart = session[:cart] || {}
    if cart.empty?
      redirect_to root_path, alert: "Aucune commande à enregistrer."
      return
    end

    # ⚡ Création de la commande pour l’utilisateur
    order = current_user.shop_orders.create!(
      total_price: cart.sum do |item_id, quantity|
        item = Item.find(item_id)
        item.price * quantity
      end
    )

    # ⚡ Envoi du mail aux admins
    OrderMailer.new_order(order).deliver_now
    # Si tu veux en asynchrone : .deliver_later

    # ⚡ On vide le panier
    session[:cart] = {}

    flash[:notice] = "Paiement réussi 🎉. Votre commande ##{order.id} a été enregistrée."
    redirect_to root_path
  end

  def cancel
    redirect_to cart_path, alert: "Le paiement a été annulé."
  end
end






  