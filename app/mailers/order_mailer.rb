# app/mailers/order_mailer.rb
class OrderMailer < ApplicationMailer
    default from: "contact@localhost"
  
    def new_order(shop_order)
      @shop_order = shop_order
      @user       = shop_order.user
  
      admins = User.where(admin: true).pluck(:email)
  
      mail(
        to: admins,
        subject: "📦 Nouvelle commande ##{@shop_order.id} de #{@user.email}"
      )
    end
  end
  
  
  
  
  
