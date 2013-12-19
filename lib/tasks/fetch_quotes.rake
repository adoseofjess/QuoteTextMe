desc "Fetch quotes"
task :fetch_quotes => :environment do 
  require 'nokogiri'
  require 'open-uri'
  require 'addressable/uri'


  page = Nokogiri::HTML(open("http://www.quotegarden.com/passion.html"))
  page.css("p").text.split("\n").each do |quote|
    if !quote.empty?
      Quote.create(body: quote,
                   category: "passion")
    end
  end
end