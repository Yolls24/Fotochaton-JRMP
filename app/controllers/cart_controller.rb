class CartController < ApplicationController
    def show
      @cart = session[:cart] || {}
      @products = Product.find(@cart.keys)
    end
  
    def add
      session[:cart] ||= {}
      session[:cart][params[:product_id]] ||= 0
      session[:cart][params[:product_id]] += 1
      redirect_to cart_path
    end
  
    def remove
      session[:cart].delete(params[:product_id])
      redirect_to cart_path
    end
  end
  