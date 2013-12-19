class QuotesController < ApplicationController
  def get_quote_by_category
    category = params[:category]
    quote = Quote.find_all_by_category(category).sample.body
    render :json => quote
  end
end
