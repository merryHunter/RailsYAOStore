class FixProductOwnerName < ActiveRecord::Migration
  def change
    rename_column :products, :parent, :owner_id
  end
end
