class FeedsController < ApplicationController
  # GET /feeds
  # GET /feeds.xml
  def index
    @feeds = Feed.all
  end

  def new
    @feed = Feed.new
  end

  def create
    @feed = Feed.new(params[:feed])
    if @feed.save
      redirect_to feeds_path
    else
      render 'new'
    end
  end

  def destroy
    @feed = Feed.find(params[:id])
    @feed.destroy
    redirect_to feeds_path
  end
end
