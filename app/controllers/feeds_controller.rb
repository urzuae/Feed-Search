class FeedsController < ApplicationController
  # GET /feeds
  # GET /feeds.xml
  def index
    @feeds = Feed.all
  end

  # GET /feeds/1
  # GET /feeds/1.xml
  def show
    @feed = Feed.find(params[:id])
    @feeds = @feed.get_matches(params[:name], params[:keywordA], params[:keywordB])
  end

  # GET /feeds/new
  # GET /feeds/new.xml
  def new
    @feed = Feed.new
  end

  # GET /feeds/1/edit
  def edit
    @feed = Feed.find(params[:id])
  end

  # POST /feeds
  # POST /feeds.xml
  def create
    @feed = Feed.new(params[:feed])
    if @feed.save
      redirect_to feeds_path
    else
      render 'new'
    end
  end

  # PUT /feeds/1
  # PUT /feeds/1.xml
  def update
    @feed = Feed.find(params[:id])
    if @feed.update_attributes(params[:feed])
      redirect_to feed_path(@feed)
    end
  end

  # DELETE /feeds/1
  # DELETE /feeds/1.xml
  def destroy
    @feed = Feed.find(params[:id])
    @feed.destroy
  end
end
