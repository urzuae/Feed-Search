# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  
  def rss
    image_tag("rss.png", :alt => "rss", :class => "rss")
  end
  
end
