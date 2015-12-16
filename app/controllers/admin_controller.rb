class AdminController < ApplicationController
  def news
  end

  def account_request
    @requests = Request.all
  end

  def users
    @users = User.all
  end

  def banners
  end
end
