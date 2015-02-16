require 'test_helper'

class ParkTest < ActiveSupport::TestCase
  
  def setup
    # Park666 has no associated courts in fixtures
    @park = parks(:park666)
  end

  test "should be valid park" do
    assert @park.valid?
  end

  test "name should be present" do
    @park.name = ""
    assert_not @park.valid?
  end 

  test "address should be present" do
    @park.address = ""
    assert_not @park.valid?
  end

  test "associated courts should be destroyed" do
    @park.save
    @park.courts.create!(img: "imgurl")
    assert_difference 'Court.count', -1 do
      @park.destroy
    end
  end
end
