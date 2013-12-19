Textquote::Application.routes.draw do
  get "quotes/category", to: "quotes#get_quote_by_category", :as => :get_quote_by_category
  # resources :quotes, :only => [] do 
  #   get "/category/:category", to: "quotes#get_quote_by_category"
  # end
  
  # resource :quote, :only => [] do 
  #   get "/category/:category", to: "quotes#get_quote_by_category"
  # end
  
  # resources :quotes, :only => [index] do 
#     collection do 
#       get :get_quote_by_category
#     end
#   end
  
  # resources :quotes, :only => [] do
 #    collection do
 #      post 'get_quote_by_category/:category', :action => 'get_quote_by_category'
 #    end
 #  end
  
  # resources :quotes
  

  
  root :to => "static_pages#index" 

  
end
