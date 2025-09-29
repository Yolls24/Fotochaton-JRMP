class ShopOrder < ApplicationRecord
  belongs_to :user  # chaque commande appartient à un utilisateur

  validates :total_price, presence: true, numericality: { greater_than_or_equal_to: 0 }
end

