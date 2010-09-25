class RssesController < ApplicationController
  # GET /rsses
  # GET /rsses.xml
  def index
    @rsses = Rss.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @rsses }
    end
  end

  # GET /rsses/1
  # GET /rsses/1.xml
  def show
    @rss = Rss.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @rss }
    end
  end

  # GET /rsses/new
  # GET /rsses/new.xml
  def new
    @rss = Rss.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @rss }
    end
  end

  # GET /rsses/1/edit
  def edit
    @rss = Rss.find(params[:id])
  end

  # POST /rsses
  # POST /rsses.xml
  def create
    @rss = Rss.new(params[:rss])

    respond_to do |format|
      if @rss.save
        format.html { redirect_to(@rss, :notice => 'Rss was successfully created.') }
        format.xml  { render :xml => @rss, :status => :created, :location => @rss }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @rss.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /rsses/1
  # PUT /rsses/1.xml
  def update
    @rss = Rss.find(params[:id])

    respond_to do |format|
      if @rss.update_attributes(params[:rss])
        format.html { redirect_to(@rss, :notice => 'Rss was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @rss.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /rsses/1
  # DELETE /rsses/1.xml
  def destroy
    @rss = Rss.find(params[:id])
    @rss.destroy

    respond_to do |format|
      format.html { redirect_to(rsses_url) }
      format.xml  { head :ok }
    end
  end
end
