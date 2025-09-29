class CreateShopOrders < ActiveRecord::Migration[8.0]
  def change
    create_table :shop_orders do |t|
      t.references :user, null: false, foreign_key: true
      t.decimal :total_price

      t.timestamps
    end
  end
end
