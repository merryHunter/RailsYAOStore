class DropChatsToDialogs < ActiveRecord::Migration
  def change_table
    drop_table :dialogs
  end
end
