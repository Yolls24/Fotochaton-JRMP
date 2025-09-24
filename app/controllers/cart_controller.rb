class CartController < ApplicationController
    def show
      @cart = session[:cart] || {}
      item_ids = @cart.keys.reject(&:blank?)       # supprime toutes les clés vides
      @items = Item.find(item_ids)
    end
  
    def add
      session[:cart] ||= {}
      session[:cart].delete("")                 # supprime clé vide si elle existe
      session[:cart][params[:item_id]] ||= 0
      session[:cart][params[:item_id]] += 1
      redirect_to cart_path
    end
  
    def remove
      session[:cart].delete(params[:item_id])
      redirect_to cart_path
    end
  end
  