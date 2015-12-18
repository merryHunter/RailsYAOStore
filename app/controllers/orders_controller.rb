class OrdersController < ApplicationController
  
  before_filter :authorize_private_and_business
  
  # GET /orders
  # GET /orders.json
  def index
    if current_user.admin?
      @orders = Order.paginate :page => params[:page], :order => 'created_at desc', :per_page => 10
    else
      @orders = Order.where(:customer_id => current_user.id)
                    .paginate :page => params[:page], :order => 'created_at desc', :per_page => 10

    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @orders }
    end
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
    @order = Order.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @order }
    end
  end

  # GET /orders/new
  # GET /orders/new.json
  def new
    @cart = current_cart
    
    if @cart.line_items.empty?
      redirect_to store_index_url, :notice => "your cart is empty!"
      return
    end
    
    @order = Order.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @order }
    end
  end

  # GET /orders/1/edit
  def edit
    @order = Order.find(params[:id])
  end

  # POST /orders
  # POST /orders.json
  def create
    @order = Order.new(params[:order])
    @order.add_line_items_from_cart(current_cart)
    @order.cart_id = current_cart.id
    @order.customer_id = current_user.id
    @order.total = current_cart.total_price
    respond_to do |format|
      if @order.save
        Cart.destroy(session[:cart_id])
        session[:cart_id] = nil
        # Notifier.order_received(@order)
        format.html { redirect_to store_index_url, notice: 'Thank you for your order!' }
        format.json { render json: @order, status: :created, location: @order }
      else
        format.html { render action: "new" }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /orders/1
  # PUT /orders/1.json
  def update
    @order = Order.find(params[:id])

    respond_to do |format|
      if @order.update_attributes(params[:order])
        format.html { redirect_to @order, notice: 'Order was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order = Order.find(params[:id])
    @order.destroy

    respond_to do |format|
      format.html { redirect_to orders_url }
      format.json { head :no_content }
    end
  end
end
