class AddPrivateIdToUsers < ActiveRecord::Migration
  def change
    add_column :users, :private_id, :integer
  end
end
