class ParksController < ApplicationController

  def index
    @parks = Park.all
    if params[:latitude] && params[:longitude]
      cookies[:location] = [sprintf("%.3f", params[:latitude]), sprintf("%.3f", params[:longitude])].join("|")
    end

    if cookies[:location]
      @latitude, @longitude = cookies[:location].split("|")
      @parks = @parks.near([@latitude.to_f, @longitude.to_f], 20)
    end
    @next_game = current_user.games.last if logged_in?

    respond_to do |format|
      format.html { render 'index' }
      format.js
    end
  end

  def show
    park = Park.find(params[:id])
    courts = park.courts

    unless park.games_today?
      time = DateTime.now
      park.create_daily_games(time)
    end

    @games = park.daily_games
  end
end
