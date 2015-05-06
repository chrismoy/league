class ParksController < ApplicationController

  def index
    @parks = Park.all
    @icon_offset = 25;
    if params[:latitude] && params[:longitude]
      cookies[:location] = [sprintf("%.3f", params[:latitude]), sprintf("%.3f", params[:longitude])].join("|")
    end

    if cookies[:location]
      @latitude, @longitude = cookies[:location].split("|")
      @parks = @parks.near([@latitude.to_f, @longitude.to_f], 200)
      @show_parks = true
    end

    respond_to do |format|
      format.html { render 'index' }
      format.js
    end
  end

  def parks_list
    @parks = Park.all
    @icon_offset = 25;
    if params[:latitude] && params[:longitude]
      cookies[:location] = [sprintf("%.3f", params[:latitude]), sprintf("%.3f", params[:longitude])].join("|")
    end

    if cookies[:location]
      @latitude, @longitude = cookies[:location].split("|")
      @parks = @parks.near([@latitude.to_f, @longitude.to_f], 200)
    end

    respond_to do |format|
      format.js
    end
  end
end
