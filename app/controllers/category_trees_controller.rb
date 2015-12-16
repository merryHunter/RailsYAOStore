class CategoryTreesController < ApplicationController
  before_filter :authorize_admin, :init




  # GET /category_trees
  # GET /category_trees.json
  def index
    @category_trees = CategoryTree.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @category_trees }
    end
  end

  # GET /category_trees/1
  # GET /category_trees/1.json
  def show
    @category_tree = CategoryTree.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @category_tree }
    end
  end

  # GET /category_trees/new
  # GET /category_trees/new.json
  def new
    @category_tree = CategoryTree.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @category_tree }
    end
  end

  # GET /category_trees/1/edit
  def edit
    @category_tree = CategoryTree.find(params[:id])
  end

  # POST /category_trees
  # POST /category_trees.json
  def create

    @category_tree = CategoryTree.new
    @category_tree.root_id = params[:root]
    @category_tree.subone_id = params[:subone]
    @category_tree.subtwo_id = params[:subtwo]

    respond_to do |format|
      if @category_tree.save
        format.html { redirect_to @category_tree, notice: 'Category tree was successfully created.' }
        format.json { render json: @category_tree, status: :created, location: @category_tree }
      else
        format.html { render action: "new" }
        format.json { render json: @category_tree.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /category_trees/1
  # PUT /category_trees/1.json
  def update
    @category_tree = CategoryTree.find(params[:id])

    respond_to do |format|
      if @category_tree.update_attributes(params[:category_tree])
        format.html { redirect_to @category_tree, notice: 'Category tree was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @category_tree.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /category_trees/1
  # DELETE /category_trees/1.json
  def destroy
    @category_tree = CategoryTree.find(params[:id])
    @category_tree.destroy

    respond_to do |format|
      format.html { redirect_to category_trees_url }
      format.json { head :no_content }
    end
  end

  private
  def init
    @categories_root = Category.where(:root => 't')
    @categories = Category.where(:root => 'f')

  end


end
