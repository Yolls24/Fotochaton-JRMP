class CartController < ApplicationController
  before_action :authenticate_user!  # s'assure que l'utilisateur est connecté

  # Affiche le panier
  def show
    @cart = session[:cart] || {}
    item_ids = @cart.keys.reject(&:blank?) # supprime les clés vides
    @items = Item.where(id: item_ids)      # récupère les produits existants
  end

  # Ajoute un produit au panier
  def add
    session[:cart] ||= {}
    session[:cart].delete("")                # supprime clé vide si elle existe
    item_id = params[:item_id].to_s
    session[:cart][item_id] ||= 0
    session[:cart][item_id] += 1

    flash[:notice] = "Produit ajouté au panier !"
    redirect_to cart_path
  end

  # Supprime un produit du panier
  def remove
    session[:cart]&.delete(params[:item_id].to_s)
    flash[:notice] = "Produit supprimé du panier."
    redirect_to cart_path
  end

  # Vide le panier
  def clear
    session[:cart] = {}
    flash[:notice] = "Votre panier a été vidé."
    redirect_to cart_path
  end
end

  