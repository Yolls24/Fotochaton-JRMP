class PaymentsController < ApplicationController
    before_action :authenticate_user!
  
    def success
      @cart = current_user.cart
      # Ici tu peux envoyer l’email de confirmation, vider le panier, créer un Order…
      @cart.cart_items.destroy_all
    end
  
    def cancel
      # Optionnel : message si l’utilisateur annule
    end
  end
  