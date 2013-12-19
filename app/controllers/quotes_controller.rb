require 'sinatra'

class QuotesController < ApplicationController
  def get_quote_by_category
    # twiml = Twilio::TwiML::Response.new do |r|
    #     r.Message "Hey Monkey. Thanks for the message!"
    #   end
    puts "get quote by category reached"
    # twiml.text
    
    
    category = params[:Body]
    quote = Quote.find_all_by_category("adversity").sample.body
    render :json => quote
  end
end
