class BusinessProfilesController < ApplicationController
  # before_filter :authorize_business
  # GET /business_profiles
  # GET /business_profiles.json
  def index
    @business_profiles = BusinessProfile.where(id: current_user.business_id)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @business_profiles }
    end
  end

  # GET /business_profiles/1
  # GET /business_profiles/1.json
  def show
    @business_profile = BusinessProfile.find(params[:id])
    @products = Product.where(owner_id: @business_profile.id)
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @business_profile }
    end
  end

  # GET /business_profiles/new
  # GET /business_profiles/new.json
  def new
    @business_profile = BusinessProfile.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @business_profile }
    end
  end

  # GET /business_profiles/1/edit
  def edit
    @business_profile = BusinessProfile.find(params[:id])
  end

  # POST /business_profiles
  # POST /business_profiles.json
  def create
    @business_profile = BusinessProfile.new(params[:business_profile])

    respond_to do |format|
      if @business_profile.save
        format.html { redirect_to @business_profile, notice: 'Business profile was successfully created.' }
        format.json { render json: @business_profile, status: :created, location: @business_profile }
      else
        format.html { render action: "new" }
        format.json { render json: @business_profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /business_profiles/1
  # PUT /business_profiles/1.json
  def update
    @business_profile = BusinessProfile.find(params[:id])

    respond_to do |format|
      if @business_profile.update_attributes(params[:business_profile])
        format.html { redirect_to @business_profile, notice: 'Business profile was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @business_profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /business_profiles/1
  # DELETE /business_profiles/1.json
  def destroy
    @business_profile = BusinessProfile.find(params[:id])
    @business_profile.destroy

    respond_to do |format|
      format.html { redirect_to business_profiles_url }
      format.json { head :no_content }
    end
  end
end
