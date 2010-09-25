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
    rss_entries = parsing
    matches_name = find_single_match(name, rss_entries)
    matches_param1 = find_single_match(param1, rss_entries)
    matches_param2 = find_single_match(param2, rss_entries)
    matches_name_param1 = double_match(matches_name, matches_param1)
    matches_name_param2 = double_match(matches_name, matches_param2)
    return [matches_name_param1, matches_name_param2, matches_param1, matches_param2]
  end
  
  def double_match(first_array, second_array)
    matches_first_second = []
    second_array.each do |entry|
      if first_array.include?(entry)
        matches_first_second << entry
      end
    end
    matches_first_second
  end
  
  def find_single_match(param, rss_entries)
    param = Regexp.new(param, true)
    matches = []
    rss_entries.entries.each do |entry|
      unless entry.summary.nil? || entry.blank?
        if entry.summary.match(param)
          matches << entry
        end
      end
    end
    matches
  end
end
