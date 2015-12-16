class RemoveCountFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :count
      end

end
