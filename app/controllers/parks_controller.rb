class ParksController < ApplicationController

  def index
    @parks = Park.all
    @icon_offset = 19;
    if params[:latitude] && params[:longitude]
      cookies[:location] = [sprintf("%.3f", params[:latitude]), sprintf("%.3f", params[:longitude])].join("|")
    end

    if cookies[:location]
      @latitude, @longitude = cookies[:location].split("|")
      @parks = @parks.near([@latitude.to_f, @longitude.to_f], 20)
    end
    @next_game = current_user.games.last if logged_in?

    @options_for_select = []
    @options_for_time = [8]

    @parks.each do |park|
      @options_for_select << [park.name, park.id]
    end

    respond_to do |format|
      format.html { render 'index' }
      format.js
    end
  end
end
