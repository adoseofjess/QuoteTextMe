desc "Fetch quotes"
task :fetch_quotes => :environment do 
  require 'nokogiri'
  require 'open-uri'
  require 'addressable/uri'


  page1 = Nokogiri::HTML(open("http://www.quotegarden.com/action.html"))
  page2 = Nokogiri::HTML(open("http://www.quotegarden.com/adversity.html"))
  page3 = Nokogiri::HTML(open("http://www.quotegarden.com/beauty.html"))
  page4 = Nokogiri::HTML(open("http://www.quotegarden.com/boldness.html"))
  page5 = Nokogiri::HTML(open("http://www.quotegarden.com/change.html"))
  page6 = Nokogiri::HTML(open("http://www.quotegarden.com/confidence.html"))
  page7 = Nokogiri::HTML(open("http://www.quotegarden.com/dreams.html"))
  page8 = Nokogiri::HTML(open("http://www.quotegarden.com/courage.html"))
  page9 = Nokogiri::HTML(open("http://www.quotegarden.com/truth.html"))
  page10 = Nokogiri::HTML(open("http://www.quotegarden.com/wisdom.html"))
  
  page1.css("p").text.split("\n").each do |quote|
    if !quote.empty?
      Quote.create(body: quote,
                   category: "action")
    end
  end
  
  page2.css("p").text.split("\n").each do |quote|
    if !quote.empty?
      Quote.create(body: quote,
                   category: "adversity")
    end
  end
  
  page3.css("p").text.split("\n").each do |quote|
    if !quote.empty?
      Quote.create(body: quote,
                   category: "beauty")
    end
  end
  
  page4.css("p").text.split("\n").each do |quote|
    if !quote.empty?
      Quote.create(body: quote,
                   category: "boldness")
    end
  end
  
  page5.css("p").text.split("\n").each do |quote|
    if !quote.empty?
      Quote.create(body: quote,
                   category: "change")
    end
  end
  
  page6.css("p").text.split("\n").each do |quote|
    if !quote.empty?
      Quote.create(body: quote,
                   category: "confidence")
    end
  end
  
  page7.css("p").text.split("\n").each do |quote|
    if !quote.empty?
      Quote.create(body: quote,
                   category: "dreams")
    end
  end
  
  page8.css("p").text.split("\n").each do |quote|
    if !quote.empty?
      Quote.create(body: quote,
                   category: "courage")
    end
  end
  
  page9.css("p").text.split("\n").each do |quote|
    if !quote.empty?
      Quote.create(body: quote,
                   category: "truth")
    end
  end
  
  page10.css("p").text.split("\n").each do |quote|
    if !quote.empty?
      Quote.create(body: quote,
                   category: "wisdom")
    end
  end
  
  
end