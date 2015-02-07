require 'test_helper'

class CourtTest < ActiveSupport::TestCase
  
  def setup
    @park = parks(:park1)
    @court = @park.courts.build(img: "image_url")
  end

  test "should be valid court" do
    assert @court.valid?
  end

  test "park id should be present" do
    @court.park_id = nil
    assert_not @court.valid?
  end 

  test "image should be present" do
    @court.img = ""
    assert_not @court.valid?
  end
end
