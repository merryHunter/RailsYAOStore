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
        business = BusinessProfile.new
        business.save
        @user.business_id = business.id
      elsif @r.private
        @user.private = true
        private = PrivateProfile.new
        private.save
        @user.private_id = private.id
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
        format.html { redirect_to admin_account_request_path, notice: "Successfully deleted!" }
        format.json { render json: @r, status: :created, location: @r }
      end
    end
  end

  def delete_account
    if params[:private]
      u = User.find_by_private_id(params[:private])
      u.private_id = nil
      u.private = false
      u.save
    elsif params[:business]
      u = User.find_by_business_id(params[:business])
      u.business_id = nil
      u.business = false
      u.save
    elsif params[:delete_user]
        User.find(params[:delete_user]).destroy
    end

    @users = User.all
    respond_to do |format|
      format.html { redirect_to admin_users_path }
      format.json { render json: @users, status: :created, location: @users }
    end
  end

  def users
    @users = User.all
  end

  def banners
  end
end
