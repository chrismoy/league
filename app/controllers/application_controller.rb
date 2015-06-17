class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :set_organization
  include SessionsHelper

  private

    # Confirms a logged in user
    def logged_in_user
      unless logged_in?
        store_location
        flash[:alert] = "Please sign up or log in"
        redirect_to login_url
      end
    end

    def set_organization
      @organizations = Organization.all
    end
end
