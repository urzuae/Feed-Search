class Rss < ActiveRecord::Base
  
  validates_presence_of :url_link
  
  def parsing
    Feedzirra::Feed.fetch_and_parse(url_link)
  end
  
end
