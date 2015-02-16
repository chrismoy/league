class ParksController < ApplicationController
  def index
    @parks = Park.all
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
