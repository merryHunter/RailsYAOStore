class AdminController < ApplicationController
  def news
  end

  def account_request
    # if request.get?
      @requests = Request.where(viewed: false)
  end

  def accept
    begin
      @r = Request.find_by_id(params[:request_id])
      @r.accepted = true
      @r.viewed = true
      @r.save
      @user = User.find_by_id(@r.user_id)
      if @r.business
        @user.business = true
      elsif @r.private
        @user.private = true
      end
      @user.save
    rescue StandardError => e
      logger.error(e.message)
      ensure
    respond_to do |format|
      format.html { redirect_to admin_account_request_path }
      format.json { render json: @r, status: :created, location: @r }
    end
    end
  end

  def reject
    begin
      @r = Request.find_by_id(params[:request_id])
      @r.accepted = false
      @r.viewed = true
      @r.save
    rescue StandardError => e
      logger.error(e.message)
    ensure
      respond_to do |format|
        format.html { redirect_to admin_account_request_path }
        format.json { render json: @r, status: :created, location: @r }
      end
    end
  end

  def users
    @users = User.all
  end

  def banners
  end
end
