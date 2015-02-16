require 'test_helper'

class GamesControllerTest < ActionController::TestCase
  
  def setup
    @game = games(:game1)
  end

  test "should redirect when not logged in" do 
    assert_no_difference 'Game.count' do
      post :create, game: { time: Time.zone.now }
    end
    assert_redirected_to login_url
  end

  test "should redirect destroy when not logged in" do
    assert_no_difference 'Game.count' do
      delete :destroy, id: @game
    end
    assert_redirected_to login_url
  end
end
