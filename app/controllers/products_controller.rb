class ProductsController < ApplicationController
  before_filter :init
  # before_filter :authorize_admin
  before_filter :authorize_private or before_filter :authorize_business or before_filter :authorize_admin

  # GET /products
  # GET /products.json
  def index
    @products = Product.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @products }
    end
  end

  # GET /products/1
  # GET /products/1.json
  def show
    @product = Product.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @product }
    end
  end

  # GET /products/new
  # GET /products/new.json
  def new
    @product = Product.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @product }
    end
  end

  # GET /products/1/edit
  def edit
    @product = Product.find(params[:id])
    @product.category_id = params[:category_id]
  end
  
  def who_bought
    @product = Product.find(params[:id])
    
    respond_to do |format|
      format.atom
      format.json { render json: @product }
      format.xml { render xml: @product }
    end
  end

  # POST /products
  # POST /products.json
  def create
    logger.debug(current_user.count)
    if  current_user.private?  &&  current_user.count  >= 5
      logger.debug("EXPIRED USER")
      respond_to do |format|
        flash[:notice] = 'You has exceed the limit of 5 products.
                                                      Upgrade your account to business!'
        format.html { redirect_to account_manager_account_path, notice: 'You has exceed the limit of 5 products.
                                                      Upgrade your account to business!' }
        format.json { render json: @product, status: :created, location: @product }
      end
      return
    end
    @product = Product.new(params[:product])
    @product.category_id = params[:category_id]
    @product.owner_id = current_user.id
    @user = User.find_by_id(current_user.id)
    @user.count += 1
    @user.save
    respond_to do |format|
      if @product.save
        format.html { redirect_to product_path, notice: 'Product was successfully created.' }
        format.json { render json: @product, status: :created, location: @product }
      else
        format.html { render action: "new" }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /products/1
  # PUT /products/1.json
  def update
    @product = Product.find(params[:id])
    @product.category_id = params[:category_id]
    @product.owner_id = current_user.id
    respond_to do |format|
      if @product.save
        format.html { redirect_to product_path, notice: 'Product was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product = Product.find(params[:id])
    @product.destroy

    respond_to do |format|
      format.html { redirect_to products_url }
      format.json { head :no_content }
    end
  end

  private
    def init
      @categories = Category.where(:root => 'f')
    end
end
