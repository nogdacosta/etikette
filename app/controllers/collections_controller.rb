class CollectionsController < ApplicationController
  before_action :set_collection, except: :index

  before_action :authenticate_user!
  ## if you want spesific action for require authentication
  ## before_filter :authenticate_user!, :only => [:action1, :action2]

  # GET /collections
  # GET /collections.json
  def index
    @collection = current_user.collection
    @collections = @collection.collections
    @bookmarks = @collection.bookmarks
  end

  # GET /collections/1
  # GET /collections/1.json
  def show
    @collections = @collection.collections
    @bookmarks = @collection.bookmarks
    @sharings = @collection.sharings
  end

  # GET /collections/:parent/new
  def new
    @item = Collection.new
  end

  # POST /collections
  # POST /collections.json
  def save
    @item = Collection.new(collection_params)
    @collection.collections << @item
    @collection.save

    @collections = @collection.collections

    # return_to = @collection.is_root? ? collections_path : collection_path
    #
    # respond_to do |format|
    #   if @item.save
    #     format.html { redirect_to return_to, notice: 'Collection was successfully created.' }
    #     format.json { render :show, status: :created, location: @collection }
    #   else
    #     format.html { render :new }
    #     format.json { render json: @collection.errors, status: :unprocessable_entity }
    #   end
    # end
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
  def destroy
    @collection.destroy
  end


  # Bookmark Actions

  def new_bookmark
    @bookmark = Bookmark.new
  end

  def edit_bookmark
    @bookmark = Bookmark.find(params[:bookmark_id])
  end

  def save_bookmark
    bookmark = Bookmark.new(bookmark_params)
    @collection.bookmarks << bookmark
    @collection.save

    @bookmarks = @collection.bookmarks

    # return_to = @collection.is_root? ? root_path : collection_path

    # respond_to do |format|
    #   if @collection.save
    #     format.html { redirect_to return_to, notice: 'Bookmark was successfully updated.' }
    #     format.json { render :show, status: :ok, location: @collection }
    #   else
    #     format.html { render :edit }
    #     format.json { render json: @collection.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  def remove_bookmark
    @bookmark = Bookmark.find(params[:bookmark_id])
    @bookmark.destroy
  end

  ### SHARE ACTIONS ###
  def share

  end

  def save_share
    sharing = Sharing.new()
    sharing.shareable = @collection

    sharing_user = User.find_for_authentication(email: params[:receiver])
    if sharing_user.nil?
      User.invite!({email: params[:receiver]}, current_user) # current_user will be set as invited_by
      sharing_user = User.find_for_authentication(email: params[:receiver])
    end

    sharing.receiver = sharing_user
    if Sharing.exists?(shareable: @collection, receiver: sharing.receiver)
      @error = "Collection has already been shared with this user."
    else
      sharing.save
    end
    @sharings = @collection.sharings

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
      params.require(:collection).permit(:name, :description, :categories, :tag_list)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bookmark_params
      params.require(:bookmark).permit(:title, :url, :tag_list)
    end

    def sharing_params
      params.require(:sharing).permit(:shareable, :receiver)
    end
end
