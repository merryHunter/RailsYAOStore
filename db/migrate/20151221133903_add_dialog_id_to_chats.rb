class AddDialogIdToChats < ActiveRecord::Migration
  def change
    add_column :chats, :dialog_id, :integer
  end
end
