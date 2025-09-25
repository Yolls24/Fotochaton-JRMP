class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one_attached :avatar   # Active Storage pour avatar
  has_one :cart, dependent: :destroy
end

