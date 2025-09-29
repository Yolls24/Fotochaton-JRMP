class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :avatar
  has_one :cart, dependent: :destroy

  # 🔗 Lien vers les commandes
  has_many :shop_orders, dependent: :destroy

  # Envoi automatique de l'email après inscription
  after_create :send_welcome_email

  private

  def send_welcome_email
    UserMailer.welcome_email(self).deliver_later
  end
end





