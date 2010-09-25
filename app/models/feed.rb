#require 'rexml/document'
require 'feedzirra'

class Feed < ActiveRecord::Base
  
  validates_presence_of :url_link
  
  def parsing
    Feedzirra::Feed.fetch_and_parse(url_link)
  end
  
  def get_matches(name, param1, param2)
    matches_name_param2 = []
    matches_name_param1 = []
    matches_name = single_match(name)
    matches_param1 = single_match(param1)
    matches_param2 = single_match(param2)
    matches_name.each do |entry|
      if matches_param1.include?(entry)
        matches_name_param1 << entry
      end
      if matches_param2.include?(entry)
        matches_name_param2 << entry
      end
    end
    return [matches_name_param1, matches_name_param2, matches_param1, matches_param2]
  end
  
  def single_match(param)
    param = Regexp.new(param, true)
    matches = []
    rss_entries = parsing
    rss_entries = rss_entries.entries
    rss_entries.each do |entry|
      unless entry.summary.nil? || entry.blank?
        if entry.summary.match(param)
          matches << entry
        end
      end
    end
    return matches
  end
end
