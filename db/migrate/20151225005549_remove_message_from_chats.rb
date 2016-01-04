class RemoveMessageFromChats < ActiveRecord::Migration
  def change
    remove_column :chats, :message
  end
end
