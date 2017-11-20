def display(list)
  list.each_with_index do |item, index|
    if item[:checked]
      puts "#{index + 1} - #{item[:name]} [x]"
    else
      puts "#{index + 1} - #{item[:name]} [ ]"
    end
  end
end

require 'open-uri'
require 'nokogiri'

# category = 0
def esty_scraper(category)
  url = "https://www.etsy.com/search?q=#{category}"
  file = open(url)
  html_text = file.read
  doc = Nokogiri::HTML(html_text)
  array = []
  doc.search('.v2-listing-card').each do |element|
    array << element.search('.text-body')[0].text.strip
  end
  return array
end
