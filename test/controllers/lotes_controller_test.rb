require 'test_helper'

class LotesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get lotes_index_url
    assert_response :success
  end

end
