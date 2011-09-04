class ShopsRequestsController < ApplicationController
  # GET /shops_requests
  # GET /shops_requests.xml
  def index
    @shops_requests = ShopsRequest.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @shops_requests }
    end
  end

  # GET /shops_requests/1
  # GET /shops_requests/1.xml
  def show
    @shops_request = ShopsRequest.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @shops_request }
    end
  end

  # GET /shops_requests/new
  # GET /shops_requests/new.xml
  def new
    @shops_request = ShopsRequest.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @shops_request }
    end
  end

  # GET /shops_requests/1/edit
  def edit
    @shops_request = ShopsRequest.find(params[:id])
  end

  # POST /shops_requests
  # POST /shops_requests.xml
  def create
    @shops_request = ShopsRequest.new(params[:shops_request])

    respond_to do |format|
      if @shops_request.save
        format.html { redirect_to(@shops_request, :notice => 'Shops request was successfully created.') }
        format.xml  { render :xml => @shops_request, :status => :created, :location => @shops_request }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @shops_request.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /shops_requests/1
  # PUT /shops_requests/1.xml
  def update
    @shops_request = ShopsRequest.find(params[:id])

    respond_to do |format|
      if @shops_request.update_attributes(params[:shops_request])
        format.html { redirect_to(@shops_request, :notice => 'Shops request was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @shops_request.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /shops_requests/1
  # DELETE /shops_requests/1.xml
  def destroy
    @shops_request = ShopsRequest.find(params[:id])
    @shops_request.destroy

    respond_to do |format|
      format.html { redirect_to(shops_requests_url) }
      format.xml  { head :ok }
    end
  end
end
