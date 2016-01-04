class CreateChatRooms < ActiveRecord::Migration
  def change
    create_table :chat_rooms do |t|
      t.integer :dialog_id
      t.integer :sender_id
      t.text :message

      t.timestamps
    end
  end
end
