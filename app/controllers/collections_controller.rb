class CollectionsController < ApplicationController
  before_action :set_collection, except: :index

  before_action :authenticate_user!
  ## if you want spesific action for require authentication
  ## before_filter :authenticate_user!, :only => [:action1, :action2]

  # GET /collections
  # GET /collections.json
  def index
    @default = current_user.collection
    @collections = @default.collections
    @bookmarks = @default.bookmarks
  end

  # GET /collections/1
  # GET /collections/1.json
  def show
    @collections = @collection.collections
    @items = @collection.bookmarks
  end

  # GET /collections/:parent/new
  def new
    @item = Collection.new
  end

  # POST /collections
  # POST /collections.json
  def save
    collection = Collection.new(collection_params)
    @collection.collections << collection
    @collection.save

    return_to = @collection.is_root? ? collections_path : collection_path

    respond_to do |format|
      if @collection.save
        format.html { redirect_to return_to, notice: 'Collection was successfully created.' }
        format.json { render :show, status: :created, location: @collection }
      else
        format.html { render :new }
        format.json { render json: @collection.errors, status: :unprocessable_entity }
      end
    end
  end

  # GET /collections/:parent/1/edit
  def edit
  end


  # PATCH/PUT /collections/1
  # PATCH/PUT /collections/1.json
  def update
    return_to = @collection.is_root? ? collections_path : collection_path

    respond_to do |format|
      if @collection.update(collection_params)
        format.html { redirect_to return_to, notice: 'Collection was successfully updated.' }
        format.json { render :show, status: :ok, location: @collection }
      else
        format.html { render :edit }
        format.json { render json: @collection.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /collections/1
  # DELETE /collections/1.json
  # def destroy
  #   @collection.destroy
  #   respond_to do |format|
  #     format.html { redirect_to collections_url, notice: 'Collection was successfully destroyed.' }
  #     format.json { head :no_content }
  #   end
  # end


  # Bookmark Actions

  def new_bookmark
    @bookmark = Bookmark.new
  end

  def save_bookmark
    bookmark = Bookmark.new(bookmark_params)
    @collection.bookmarks << bookmark
    @collection.save

    return_to = @collection.is_root? ? collections_path : collection_path

    respond_to do |format|
      if bookmark.save
        format.html { redirect_to return_to, notice: 'Bookmark was successfully updated.' }
        format.json { render :show, status: :ok, location: @collection }
      else
        format.html { render :edit }
        format.json { render json: @collection.errors, status: :unprocessable_entity }
      end
    end

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_collection
      @collection = Collection.find(params[:collection_id])
    end

    def authorized_user
      @collection = current_user.collections.find_by(id: params[:collection_id])
      redirect_to collections_path, notice: "Not authorized to edit this collection" if @collection.nil?
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def collection_params
      params.require(:collection).permit(:name, :description, :tags, :categories)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bookmark_params
      params.require(:bookmark).permit(:title, :url, :tags)
    end
end
