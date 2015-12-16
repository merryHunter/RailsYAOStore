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
      @r.accepted = 1
      @r.viewed = 1
      @r.save
    rescue StandardError => e
      logger.error(e.message)
    end
  end

  def reject
    begin
      @r = Request.find_by_id(params[:request_id])
      @r.accepted = 0
      @r.viewed = 0
      @r.save
    rescue StandardError => e
      logger.error(e.message)
    end
  end

  def users
    @users = User.all
  end

  def banners
  end
end
