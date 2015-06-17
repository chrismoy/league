class ParksController < ApplicationController

  def index
    unless logged_in? or params[:organization]
      redirect_to landing_url and return
    end

    respond_to do |format|
      format.html { render 'index' }
      format.js
    end
  end

  def show
    @park = Park.find(params[:id])
  end

  def parks_list

    # byebug

    @organization = Organization.find(params[:organization_id] || current_user.organization_id)

    @parks = @organization.parks

    @icon_offset = 27;

    if params[:latitude] && params[:longitude]
      cookies[:location] = [sprintf("%.3f", params[:latitude]), sprintf("%.3f", params[:longitude])].join("|")
    end

    if cookies[:location]
      @latitude, @longitude = cookies[:location].split("|")
      @parks = @parks.near([@latitude.to_f, @longitude.to_f], 50)
    end

    respond_to do |format|
      format.js
    end
  end
end
