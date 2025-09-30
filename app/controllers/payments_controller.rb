class PaymentsController < ApplicationController
  before_action :authenticate_user!

  def success
    # ⚠️ Ne jamais utiliser ShopOrder.last, toujours le user courant
    @shop_order = current_user.shop_orders.last

    if @shop_order.present?
      # Envoi des mails
      OrderMailer.new_order(@shop_order).deliver_now
      OrderMailer.confirm_order(@shop_order).deliver_now

      redirect_to checkout_success_path, notice: "Merci ! Votre commande a bien été enregistrée."
    else
      redirect_to root_path, alert: "Erreur : aucune commande trouvée."
    end
  end

  def cancel
    redirect_to cart_path, alert: "Paiement annulé 😿"
  end
end













  