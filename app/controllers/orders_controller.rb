class OrdersController < ApplicationController
  before_action :authenticate_user!

  def new
    @shop_order = ShopOrder.new
  end

  def create
    @shop_order = current_user.shop_orders.new(order_params)

    if @shop_order.save
      # Mails envoyés **au user et aux admins**
      OrderMailer.new_order(@shop_order).deliver_now
      OrderMailer.confirm_order(@shop_order).deliver_now

      # On vide le panier (si stocké en session)
      session[:cart] = nil  

      redirect_to @shop_order, notice: "Votre commande a bien été enregistrée 🐾"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @shop_order = current_user.shop_orders.find(params[:id])
  end

  private

  def order_params
    params.require(:shop_order).permit(:total_price, :shipping_address)
  end
end



  

  
  

  
