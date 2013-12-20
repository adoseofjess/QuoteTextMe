require 'sinatra'

class QuotesController < ApplicationController
  def get_quote_by_category
    # twiml = Twilio::TwiML::Response.new do |r|
    #     r.Message "Hey Monkey. Thanks for the message!"
    #   end
    # puts "get quote by category reached"
    # twiml.text
    
    twilio_sid = "ACd7dd27b30e686e40faa24877ad956ff2"
    twilio_token = "7ec5eea31b2e81aa582b360c683b7a1a"
    twilio_phone_number = "4249032256"
    
    number_to_send_to = params[:From]
    category = params[:Body]
    @twilio_client = Twilio::REST::Client.new twilio_sid, twilio_token
    
    quote = Quote.find_all_by_category(category).sample.body
    
    if quote.length > 320
      quote_words_array = quote.split(" ")
      midpoint = quote_words_array.length / 3
      first_sms = quote_words_array[0...midpoint].join("")
      second_sms = quote_words_array[2*midpoint...3*midpoint].join("")
      third_sms = quotes_words_array[3*midpoint..-1].join("")
      
      @twilio_client.account.sms.messages.create(
            :from => "+1#{twilio_phone_number}",
            :to => number_to_send_to,
            :body => "#{first_sms}"
          )
          
      @twilio_client.account.sms.messages.create(
            :from => "+1#{twilio_phone_number}",
            :to => number_to_send_to,
            :body => "#{second_sms}"
          )    
          
      @twilio_client.account.sms.messages.create(
            :from => "+1#{twilio_phone_number}",
            :to => number_to_send_to,
            :body => "#{third_sms}"
          )  
    elsif quote.length >= 160 && quote.length <= 320
      quote_words_array = quote.split(" ")
      midpoint = quote_words_array.length / 2
      first_sms = quote_words_array[0...midpoint].join("")
      second_sms = quote_words_array[midpoint..-1].join("")
      
      @twilio_client.account.sms.messages.create(
            :from => "+1#{twilio_phone_number}",
            :to => number_to_send_to,
            :body => "#{first_sms}"
          )
          
      @twilio_client.account.sms.messages.create(
            :from => "+1#{twilio_phone_number}",
            :to => number_to_send_to,
            :body => "#{second_sms}"
          )    
       
    elsif quote.length < 160 
      @twilio_client.account.sms.messages.create(
            :from => "+1#{twilio_phone_number}",
            :to => number_to_send_to,
            :body => "#{quote}"
          )
    end
    # render :json => quote
    
  end
end
