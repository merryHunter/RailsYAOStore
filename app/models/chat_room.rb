class ChatRoom < ActiveRecord::Base
  attr_accessible :dialog_id, :message, :sender_id
end
