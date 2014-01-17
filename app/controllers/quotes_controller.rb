require 'sinatra'

class QuotesController < ApplicationController
  def get_quote_by_category    
    @categories = Quote.pluck(:category).uniq.sort.join(", ")
    
    twilio_sid = "ACd7dd27b30e686e40faa24877ad956ff2"
    twilio_token = "7ec5eea31b2e81aa582b360c683b7a1a"
    twilio_phone_number = "4249032256"
    
    number_to_send_to = params[:From]
    
    puts params[:Body]
    
    if params[:Body].downcase.strip == "categories"
      puts "categories"
      puts @categories
      
      if @categories.length > 150
        @twilio_client = Twilio::REST::Client.new twilio_sid, twilio_token
        @twilio_client.account.sms.messages.create(
              :from => "+1#{twilio_phone_number}",
              :to => number_to_send_to,
              :body => "Try sending a text with one of the following categories:"
            )
        @twilio_client.account.sms.messages.create(
              :from => "+1#{twilio_phone_number}",
              :to => number_to_send_to,
              :body => "#{@categories[0...150]}"
            )
        @twilio_client.account.sms.messages.create(
              :from => "+1#{twilio_phone_number}",
              :to => number_to_send_to,
              :body => "#{@categories[150..-1]}"
            )
        
      else
        @twilio_client = Twilio::REST::Client.new twilio_sid, twilio_token
        @twilio_client.account.sms.messages.create(
              :from => "+1#{twilio_phone_number}",
              :to => number_to_send_to,
              :body => "Try sending a text with one of the following categories:"
            )
        @twilio_client.account.sms.messages.create(
              :from => "+1#{twilio_phone_number}",
              :to => number_to_send_to,
              :body => "#{@categories}"
            )
      end
    elsif @categories.include?(params[:Body])
      puts "print quote"
      category = params[:Body].downcase.strip
      @twilio_client = Twilio::REST::Client.new twilio_sid, twilio_token
    
      quote1 = Quote.find_all_by_category(category).sample.body
      
      quote2 = Quote.find_all_by_category(category).find_all { |quote| quote.body.length < 160 }.sample.body
      puts quote1
      puts quote2
      
      @twilio_client.account.sms.messages.create(
            :from => "+1#{twilio_phone_number}",
            :to => number_to_send_to,
            :body => "#{quote2}"
          )
          
    else
      puts "not valid category"
      @twilio_client = Twilio::REST::Client.new twilio_sid, twilio_token
      @twilio_client.account.sms.messages.create(
            :from => "+1#{twilio_phone_number}",
            :to => number_to_send_to,
            :body => "That is not a valid category! Text 'categories' to get a list of possible categories."
          )
    end
  end
end
