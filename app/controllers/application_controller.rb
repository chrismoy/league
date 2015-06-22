class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :set_organizations
  around_action :set_timezone

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

    private

      def set_organizations
        @organizations = Organization.all
      end

      def set_timezone
        timezone = Time.find_zone(cookies[:timezone])
        Time.use_zone(timezone) {yield}
      end
end
