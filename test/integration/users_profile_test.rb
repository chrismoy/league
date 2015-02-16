require 'test_helper'

class UsersProfileTest < ActionDispatch::IntegrationTest
  include ApplicationHelper


  def setup
    @user = users(:chris)
    @park = parks(:park1)
    @court = courts(:court1)
    31.times do |n|
      @user.games.create!(court: @court, time: Time.zone.now )
    end
  end

  test "profile display" do 
    get user_path(@user)
    assert_template 'users/show'
    assert_select 'title', full_title(@user.name)
    assert_select 'h1', text: @user.name
    assert_select 'h1>img.gravatar'
    assert_match  @user.games.count.to_s, response.body
    assert_select 'div.pagination'
  end
end
