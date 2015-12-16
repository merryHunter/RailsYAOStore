class AccountManagerController < ApplicationController
  before_filter :authenticate_user!

  def account

  end

  def create_private
    logger.debug("CREATE PRIVATE")
    if request.post?
      logger.debug("CREATE PRIVATE POST")
      begin
        @acc_request = Request.new
        logger.debug("REQUEST")
        @acc_request.user_id = current_user.id
        @acc_request.private = 1
        logger.debug("REQUEST")
        respond_to do |format|
          if @acc_request.save
            logger.debug("SUCCESSFUL")
            format.html { redirect_to account_manager_account_path, notice: 'Request was successfully created.' }
          else
            format.html { render action: "account_manager/account" }
          end
        end

      rescue StandardError => e
        logger.error(e.message)
      end
    end
  end

  def create_business
  end

  def private
  end

  def business
  end
end
