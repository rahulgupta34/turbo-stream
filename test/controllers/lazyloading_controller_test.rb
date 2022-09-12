require "test_helper"

class LazyloadingControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get lazyloading_index_url
    assert_response :success
  end
end
