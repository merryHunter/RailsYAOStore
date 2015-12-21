class StoreController < ApplicationController
  
  skip_before_filter :authorize
  
  def index
    if params[:set_locale]
      redirect_to store_path(locale: params[:set_locale])
    else
      @products = Product.all
      @cart = current_cart
    end
  end

  def seller
      seller_id = Product.find(params[:product_id]).owner_id
      begin
        if PrivateProfile.find_by_id(seller_id)
          redirect_to url_for(:controller => :private_profiles, :action => :show, :id => seller_id)
          return
        end
      end
      begin
        if BusinessProfile.find_by_id(seller_id)
          redirect_to url_for(:controller => :business_profiles, :action => :show, :id => seller_id)
          return
        end
      end
      render_404
  end
end
