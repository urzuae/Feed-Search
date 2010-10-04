class ParametersController < ApplicationController
  before_filter :find_feeds, :only => [:show, :new]
  before_filter :find_parameter, :only => [:show, :edit, :update, :destroy]

  def index
    @parameters = Parameter.all
  end

  def show
    if @feeds.empty?
      redirect_to (parameters_path, :notice => "There are not feeds sources. Add a feed source <a href=#{new_feed_path}>now...</a>")
    else
      @feeds = Feed.first.get_matches(@parameter)
      @google = @parameter.get_google_matches
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
