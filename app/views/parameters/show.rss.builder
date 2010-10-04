xml.instruct!
xml.rss :version => "2.0" do
  xml.channel do
    xml.title "Feed Results"
    xml.description "Main: #{@parameter.main} || Keyword A: #{@parameter.keyword_a} || Keyword B: #{@parameter.keyword_b}"
    xml.link feeds_url(:rss)
    @feeds.each do |rss|
      for entry in rss
        xml.item do
          xml.title entry.title
          xml.link entry.url
          xml.description entry.summary
        end
      end
       puts rss.last.inspect
    end
    @google["responseData"]["results"].each do |feed|
      xml.item do
        xml.title feed["titleNoFormatting"]
        xml.link feed["unescapedUrl"]
        xml.description feed["content"]
      end
    end
  end
end

