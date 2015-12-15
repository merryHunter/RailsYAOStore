class AccountManagerController < ApplicationController
  before_filter :authenticate_user!

  def account

  end

  def create_private
  end

  def create_business
  end

  def private
  end

  def business
  end
end
