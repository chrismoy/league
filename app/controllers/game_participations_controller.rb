class GameParticipationsController < ApplicationController
  before_action :logged_in_user

  def update
    @game = Game.find(params[:id])
    unless(@game.users.include?(current_user) ||
           @game.users.count >= 5 ||
           current_user.games_today.count >= 2)
      @game.users << current_user
      @join_game = true
    end

    respond_to do |format|
      format.html { redirect_to :back, notice: "Joined Game" }
      format.js
    end
  end

  def destroy
    @game = Game.find(params[:id])
    if @game.users.include?(current_user)
      @game.users.delete(current_user)
      # if @game.users.empty?
      #   @game.destroy
      # end
    end

    respond_to do |format|
      format.html { redirect_to root_url,
                    notice: "You Have Quit the #{@game.time.strftime("%-I:%M%p")} Game at #{@game.court.park.name}"
      }
      format.js
    end
  end
end
