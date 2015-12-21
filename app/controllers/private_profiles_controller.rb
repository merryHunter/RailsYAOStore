class PrivateProfilesController < ApplicationController
  # before_filter :authorize_private
  # GET /private_profiles
  # GET /private_profiles.json
  def index
    if current_user.admin?
      @private_profiles = PrivateProfile.all
    elsif current_user.private? # == true
      @private_profiles = PrivateProfile.where(id: current_user.private_id)
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @private_profiles }
    end
  end

  # GET /private_profiles/1
  # GET /private_profiles/1.json
  def show
    @private_profile = PrivateProfile.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @private_profile }
    end
  end

  # GET /private_profiles/new
  # GET /private_profiles/new.json
  def new
    @private_profile = PrivateProfile.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @private_profile }
    end
  end

  # GET /private_profiles/1/edit
  def edit
    @private_profile = PrivateProfile.find(params[:id])
  end

  # POST /private_profiles
  # POST /private_profiles.json
  def create
    @private_profile = PrivateProfile.new(params[:private_profile])

    respond_to do |format|
      if @private_profile.save
        format.html { redirect_to @private_profile, notice: 'Private profile was successfully created.' }
        format.json { render json: @private_profile, status: :created, location: @private_profile }
      else
        format.html { render action: "new" }
        format.json { render json: @private_profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /private_profiles/1
  # PUT /private_profiles/1.json
  def update
    @private_profile = PrivateProfile.find(params[:id])

    respond_to do |format|
      if @private_profile.update_attributes(params[:private_profile])
        format.html { redirect_to @private_profile, notice: 'Private profile was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @private_profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /private_profiles/1
  # DELETE /private_profiles/1.json
  def destroy
    @private_profile = PrivateProfile.find(params[:id])
    @private_profile.destroy

    respond_to do |format|
      format.html { redirect_to private_profiles_url }
      format.json { head :no_content }
    end
  end
end
