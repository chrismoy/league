class MainPagesController < ApplicationController
  
  def home
    if logged_in?
      redirect_to parks_url
    end
  end

  def help
  end

  def about
  end

  def contact
  end
end
