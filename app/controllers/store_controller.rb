class StoreController < ApplicationController
  
  skip_before_filter :authorize
  before_filter :init
  def index
    begin
    Notifier.welcome_email(current_user.email).deliver
    rescue
      redirect_to store_path(locale: params[:set_locale]), notice:  "Could not send mail!"
    end
    if params[:set_locale]
      redirect_to store_path(locale: params[:set_locale])
    else
      @products = Product.all
      @cart = current_cart
    end
  end

  def chat
    seller_id = Product.find(params[:product_id]).owner_id
    begin
      if PrivateProfile.find_by_id(seller_id)
        id = PrivateProfile.find_by_id(seller_id).id
        # receiver_id = User.where(private_id: id).id
        redirect_to url_for(:controller => :chat,
                            :action => :index,
                            :receiver_id => id)
        return
      end
    end
    begin
      if BusinessProfile.find_by_id(seller_id)
        id = BusinessProfile.find_by_id(seller_id).id
        # receiver_id = User.where(business_id: id).id
        redirect_to url_for(:controller => :chat,
                            :action => :index,
                            :receiver_id => id)
        return
      end
    end
    render_404
  end

  # TODO:fix logic, private id shadow business id
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
  private
  def init
    @categories_titles = {}
    cc = Category.all
    cc.each do  |c|
      @categories_titles[c.id] = c.title
    end
  end
end
