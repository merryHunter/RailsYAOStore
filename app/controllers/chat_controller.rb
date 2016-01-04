class ChatController < ApplicationController
  before_filter :authenticate_user!, :init_chat

  def init_chat
    logger.debug("INDEX")
      if current_user.private?
        logger.debug("INDEX1")
        sender_id = current_user.business_id
        if sender_id.nil?
          sender_id = current_user.private_id
        end
        @dialog = Dialog.find_by_receiver_id(params[:receiver_id])
        if !@dialog
          logger.debug("INDEX5")
          @dialog = Dialog.new
          @dialog.receiver_id = params[:receiver_id]
          @dialog.sender_id = sender_id
          @dialog.save

        end
      else
        logger.debug("INDEX2")
        sender_id = current_user.private_id
        if sender_id.nil?
          sender_id = current_user.business_id
        end
        @dialog = Dialog.find_by_sender_id(params[:receiver_id])
        if !@dialog
          logger.debug("INDEX3")
          @dialog = Dialog.new
          @dialog.receiver_id = params[:receiver_id]
          @dialog.sender_id = sender_id
          @dialog.save

        end

      end
      @message = ""
      logger.debug(@dialog.to_s)
      logger.debug("===============\n==========\n=============")
      @chat = ChatRoom.where(dialog_id: @dialog.id)
      @record = ChatRoom.new
  end

  def index
    logger.debug("INDEX")
    logger.debug("INDEX")
    logger.debug("INDEX")
    logger.debug("INDEX")
    @chat = ChatRoom.where(dialog_id: @dialog.id)
    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => {:chat => @chat, :message => @message} }
    end
  end

  def new
    @record = ChatRoom.new
    @record.sender_id = current_user.id
    @record.message = params[:message]
    @record.dialog_id = @dialog.id
    @record.save
    if @chat.nil?
      @chat = @record
    else
      @chat << @record
    end
    @message = ""
    respond_to do |format|
      format.html {redirect_to chat_index_path}
      format.json { render :json => {:chat => @chat, :message => @message} }
    end
  end
end
