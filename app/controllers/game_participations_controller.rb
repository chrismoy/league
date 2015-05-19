class GameParticipationsController < ApplicationController
  before_action :logged_in_user

  def update
    @game = Game.find(params[:id])
    @join_game = 0
    unless(@game.users.include?(current_user) ||
           @game.users.count >= 6 ||
           current_user.games_today.count >= 4)
      @game.users << current_user
      @join_game = 1
      UserMailer.game_notification(current_user, @game).deliver
    end

    respond_to do |format|
      format.html { redirect_to root_url,
                    notice: "You Have Joined The Game. You will receive and email confirmation shortly."
      }
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
