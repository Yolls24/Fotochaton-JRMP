class OrderMailer < ApplicationMailer
  default from: "contact@localhost"

  # Mail aux admins
  def new_order(shop_order)
    @shop_order = shop_order
    @user = @shop_order.user      # <- IMPORTANT, il faut cette ligne !
    @admins = User.where(admin: true).pluck(:email)

    mail(to: @admins, subject: "📦 Nouvelle commande ##{@shop_order.id} de #{@user.email}")
  end

  # Mail au client
  def confirm_order(shop_order)
    @shop_order = shop_order
    @user = @shop_order.user      # déjà correct

    mail(to: @user.email, subject: "Votre commande ##{@shop_order.id} a été enregistrée 🐾")
  end
end














  
  
  
  
  
