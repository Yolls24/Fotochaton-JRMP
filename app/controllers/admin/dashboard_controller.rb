class Admin::DashboardController < ApplicationController
  before_action :authenticate_user!   # Vérifie que l'utilisateur est connecté
  before_action :check_admin          # Vérifie que c'est un admin

  def index
    # Ici tu peux mettre toutes les infos que tu veux pour l'admin
    @users = User.all
    @items = Item.all
  end

  private

  def check_admin
    unless current_user.admin?
      redirect_to root_path, alert: "Vous n'êtes pas autorisé à accéder à cette page."
    end
  end
end
