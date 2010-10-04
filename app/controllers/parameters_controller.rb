class ParametersController < ApplicationController
  before_filter :find_feeds
  before_filter :find_parameter, :only => [:show, :edit, :update, :destroy]

  def index
    @parameters = Parameter.all
  end

  def show
    if @feeds.empty?
      now = "<a href=#{new_feed_path}>now...</a>"
      redirect_to (parameters_path, :notice => "There are not feeds sources. Add a feed source #{now}")
    else
      parameters = [@parameter.main, @parameter.keyword_a, @parameter.keyword_b]
      @feed = Feed.first
      @feeds = @feed.get_matches(parameters)
      google = Net::HTTP.get(URI.parse("http://ajax.googleapis.com/ajax/services/search/news?v=1.0&q=#{parameters.join("%20")}"))
      @google = ActiveSupport::JSON.decode(google)
    end
  end

  def new
    unless @feeds.empty?
      @parameter = Parameter.new
    else
      redirect_to (new_feed_path, :notice => "A feed source needs to be added.")
    end
  end

  def edit
  end

  def create
    @parameter = Parameter.new(params[:parameter])
    if @parameter.save
      redirect_to(parameter_path(@parameter, :rss))
    else
      render :action => "new"
    end
  end

  def update
    if @parameter.update_attributes(params[:parameter])
      redirect_to(@parameter, :notice => 'Parameter was successfully updated.')
    else
      render :action => "edit"
    end
  end

  def destroy
    @parameter.destroy
    redirect_to(parameters_url)
  end
  
  private
  
  def find_feeds
    @feeds = Feed.all
  end
  
  def find_parameter
    @parameter = Parameter.find(params[:id])
  end
end
