class OrdersController < ApplicationController
  before_action :authenticate_user!

  def new
    @shoporder = ShopOrder.new
  end

  def create
    @shoporder = current_user.shop_orders.new(order_params)

    if @shoporder.save
      # Mails envoyés **au user et aux admins**, correctement liés à cette commande
      OrderMailer.new_order(@shoporder).deliver_now
      OrderMailer.confirm_order(@shoporder).deliver_now

      redirect_to @shoporder, notice: "Votre commande a bien été enregistrée 🐾"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @shoporder = current_user.shop_orders.find(params[:id])
  end

  private

  def order_params
    params.require(:shop_order).permit(:total_price, :shipping_address)
  end
end


  

  
  

  
