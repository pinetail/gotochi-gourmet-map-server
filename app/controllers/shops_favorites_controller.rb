class ShopsFavoritesController < ApplicationController
  # GET /shops_favorites
  # GET /shops_favorites.xml
  def index
    @shops_favorites = ShopsFavorite.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @shops_favorites }
    end
  end

  # GET /shops_favorites/1
  # GET /shops_favorites/1.xml
  def show
    @shops_favorite = ShopsFavorite.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @shops_favorite }
    end
  end

  # GET /shops_favorites/new
  # GET /shops_favorites/new.xml
  def new
    @shops_favorite = ShopsFavorite.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @shops_favorite }
    end
  end

  # GET /shops_favorites/1/edit
  def edit
    @shops_favorite = ShopsFavorite.find(params[:id])
  end

  # POST /shops_favorites
  # POST /shops_favorites.xml
  def create
    @shops_favorite = ShopsFavorite.new(params[:shops_favorite])

    respond_to do |format|
      if @shops_favorite.save
        format.html { redirect_to(@shops_favorite, :notice => 'Shops favorite was successfully created.') }
        format.xml  { render :xml => @shops_favorite, :status => :created, :location => @shops_favorite }
        format.json { render :json => @shops_favorite, :status => :created, :location => @shops_favorite }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @shops_favorite.errors, :status => :unprocessable_entity }
        format.json { render :json => @shops_favorite.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /shops_favorites/1
  # PUT /shops_favorites/1.xml
  def update
    @shops_favorite = ShopsFavorite.find(params[:id])

    respond_to do |format|
      if @shops_favorite.update_attributes(params[:shops_favorite])
        format.html { redirect_to(@shops_favorite, :notice => 'Shops favorite was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @shops_favorite.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /shops_favorites/1
  # DELETE /shops_favorites/1.xml
  def destroy
    @shops_favorite = ShopsFavorite.find(params[:id])
    @shops_favorite.destroy

    respond_to do |format|
      format.html { redirect_to(shops_favorites_url) }
      format.xml  { head :ok }
    end
  end
  
  # DELETE /shops_favorites/del(.:format)
  def del
    @shops_favorite = ShopsFavorite.where('uuid = ? and tabelog_id = ?', params[:shops_favorite][:uuid], params[:shops_favorite][:tabelog_id]).first
    if @shops_favorite.nil?
      respond_to do |format|
        format.html { redirect_to(shops_favorites_url) }
        format.xml  { head :ok }
        format.json { render :json => 'not record' }
      end
    else
      @shops_favorite.destroy

      respond_to do |format|
        format.html { redirect_to(shops_favorites_url) }
        format.xml  { head :ok }
        format.json { render :json => 'ok' }
      end
    end
  end
  
  # POST /shops_favorites/upd_twitter_id(.:format)
  def upd_twitter_id
    @shops_favorites = ShopsFavorite.where('uuid = ?', params[:shops_favorite][:uuid]).update_all(:twitter_id => params[:shops_favorite][:twitter_id])
    if @shops_favorites.nil?
      respond_to do |format|
        format.html { redirect_to(shops_favorites_url) }
        format.xml  { head :ok }
        format.json { render :json => 'not record' }
      end
    else
      respond_to do |format|
        format.html { redirect_to(shops_favorites_url) }
        format.xml  { head :ok }
        format.json { render :json => 'ok' }
      end
    end
  end

  # GET /shops_favorites/get_my_fav(.:format)
  def get_my_fav
    @shops_favorites = ShopsFavorite.where('twitter_id = ?', params[:shops_favorite][:twitter_id])
    if @shops_favorites.nil?
      respond_to do |format|
        format.html { redirect_to(shops_favorites_url) }
        format.xml  { head :ok }
        format.json { render :json => { "result" => 0, "count" => 0 } }
      end
    else
      respond_to do |format|
        format.html { redirect_to(shops_favorites_url) }
        format.xml  { render :xml => @shops_favorites }
        format.json { render :json => { "result" => 0, "count" => @shops_favorites.size, "favorites" => @shops_favorites} }
      end
    end
  end

end
