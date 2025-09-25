class RemoveItemIdAndQuantityFromCarts < ActiveRecord::Migration[8.0]
  def change
    remove_column :carts, :item_id, :integer
    remove_column :carts, :quantity, :integer
  end
end
