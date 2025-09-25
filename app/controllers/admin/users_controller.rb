class Admin::UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :check_admin

  def make_admin
    user = User.find(params[:id])
    user.update(admin: true)
    redirect_to admin_dashboard_path, notice: "#{user.email} est maintenant admin !"
  end

  def remove_admin
    user = User.find(params[:id])
    user.update(admin: false)
    redirect_to admin_dashboard_path, notice: "#{user.email} a été rétrogradé en utilisateur."
  end

  private

  def check_admin
    redirect_to root_path, alert: "Accès refusé." unless current_user.admin?
  end
end

