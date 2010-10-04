class Parameter < ActiveRecord::Base
  
  validates_presence_of :main, :keyword_a, :keyword_b
  
  def google_matches
    params = [main, keyword_a, keyword_b]
    Net::HTTP.get(URI.parse("http://ajax.googleapis.com/ajax/services/search/news?v=1.0&q=#{params.join("%20")}"))
  end
  
  def get_google_matches
    ActiveSupport::JSON.decode(google_matches)
  end
  
end
