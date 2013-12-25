desc "Fetch quotes"
task :fetch_quotes => :environment do 
  require 'nokogiri'
  require 'open-uri'
  require 'addressable/uri'


  page1 = Nokogiri::HTML(open("http://www.quotegarden.com/love.html"))
  page2 = Nokogiri::HTML(open("http://www.quotegarden.com/age.html"))
  page3 = Nokogiri::HTML(open("http://www.quotegarden.com/death.html"))
  page4 = Nokogiri::HTML(open("http://www.quotegarden.com/success.html"))
  page5 = Nokogiri::HTML(open("http://www.quotegarden.com/family.html"))
  page6 = Nokogiri::HTML(open("http://www.quotegarden.com/opportunities.html"))
  page7 = Nokogiri::HTML(open("http://www.quotegarden.com/mistakes.html"))
  page8 = Nokogiri::HTML(open("http://www.quotegarden.com/forgiveness.html"))
  page9 = Nokogiri::HTML(open("http://www.quotegarden.com/emotions.html"))
  page10 = Nokogiri::HTML(open("http://www.quotegarden.com/life.html"))
  
  page1.css("p").text.split("\n").each do |quote|
    if !quote.empty?
      Quote.create(body: quote,
                   category: "love")
    end
  end
  
  page2.css("p").text.split("\n").each do |quote|
    if !quote.empty?
      Quote.create(body: quote,
                   category: "age")
    end
  end
  
  page3.css("p").text.split("\n").each do |quote|
    if !quote.empty?
      Quote.create(body: quote,
                   category: "death")
    end
  end
  
  page4.css("p").text.split("\n").each do |quote|
    if !quote.empty?
      Quote.create(body: quote,
                   category: "success")
    end
  end
  
  page5.css("p").text.split("\n").each do |quote|
    if !quote.empty?
      Quote.create(body: quote,
                   category: "family")
    end
  end
  
  page6.css("p").text.split("\n").each do |quote|
    if !quote.empty?
      Quote.create(body: quote,
                   category: "opportunities")
    end
  end
  
  page7.css("p").text.split("\n").each do |quote|
    if !quote.empty?
      Quote.create(body: quote,
                   category: "mistakes")
    end
  end
  
  page8.css("p").text.split("\n").each do |quote|
    if !quote.empty?
      Quote.create(body: quote,
                   category: "forgiveness")
    end
  end
  
  page9.css("p").text.split("\n").each do |quote|
    if !quote.empty?
      Quote.create(body: quote,
                   category: "emotions")
    end
  end
  
  page10.css("p").text.split("\n").each do |quote|
    if !quote.empty?
      Quote.create(body: quote,
                   category: "life")
    end
  end
  
  
end