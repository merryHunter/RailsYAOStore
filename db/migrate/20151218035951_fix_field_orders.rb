class FixFieldOrders < ActiveRecord::Migration
  def change
    rename_column :orders, :product_id, :cart_id
  end
end
