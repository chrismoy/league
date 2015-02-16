require 'test_helper'

class GameTest < ActiveSupport::TestCase
  
  def setup
    @court = courts(:court1)
    @game = @court.games.build(time: Time.zone.now)
  end

  test "should be valid game" do
    assert @game.valid?
  end

  test "court id should be present" do
    @game.court_id = nil
    assert_not @game.valid?
  end 

  test "game time should be present" do
    @game.time = nil
    assert_not @game.valid?
  end

  test "order should be latest game first" do
    assert_equal Game.first, games(:earliest_game)
  end
end
