class Order < ApplicationRecord
    belongs_to :user
  
    after_create :notify_admins
  
    private
  
    def notify_admins
      OrderMailer.new_order(self).deliver_now
      # 👉 en prod, tu mettras plutôt `.deliver_later`
    end
  end
  