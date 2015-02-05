require 'test_helper'

class ApplicationHelperTest < ActionView::TestCase
  test "full title helper" do 
    assert_equal full_title,          "The D-League"
    assert_equal full_title("Help"),  "Help | The D-League"
  end
end