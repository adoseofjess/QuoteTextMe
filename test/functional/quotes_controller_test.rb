require 'test_helper'

class QuotesControllerTest < ActionController::TestCase
  test "should get get_quote_by_category" do
    get :get_quote_by_category
    assert_response :success
  end

end
