class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :set_i18n_locale_from_params, :authenticate_user!
  before_filter :load_banners

  private

  def load_banners
    @banners = Banner.all
  end

  def current_cart
    Cart.find(session[:cart_id])
  rescue ActiveRecord::RecordNotFound
    cart = Cart.create
    session[:cart_id] = cart.id
    cart
  end
  
  protected
  def render_404
    respond_to do |format|
      format.html { render :file => "#{Rails.root}/public/404", :layout => false, :status => :not_found }
      format.xml  { head :not_found }
      format.any  { head :not_found }
    end
  end
  def authorize
    unless current_user
      redirect_to new_user_session_path, :notice => "Please log in!"
    end
  end

  def authorize_private_and_business
    unless current_user.private? || current_user.business? || current_user.admin?
      redirect_to store_index_path, :notice => "Please, upgrade your account to private or business!"
    end
  end

  def authorize_admin
    unless current_user.admin?
      redirect_to new_user_session_path, :notice => "Please log in as admin!"
    end
  end

  def authorize_private
    unless current_user.private?
      redirect_to new_user_session_path, :notice => "Please log in!"
    end
  end

  def authorize_business
    unless current_user.business
      redirect_to new_user_session_path, :notice => "Please log in!"
    end
  end

  def set_i18n_locale_from_params
    if params[:locale]
      if I18n.available_locales.include?(params[:locale].to_sym)
        I18n.locale = params[:locale]
      else
        flash.now[:notice] =
            "#{params[:locale]} translation not available"
        logger.error flash.now[:notice]
      end
    end
  end

  def default_url_options
    { :locale => I18n.locale }
  end
end
