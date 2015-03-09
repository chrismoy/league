class GameParticipationsController < ApplicationController
  before_action :logged_in_user

  def update
    @game = Game.find(params[:id])
    unless @game.users.include?(current_user) || @game.users.count >= 6
      @game.users << current_user
    end

    respond_to do |format|
      format.html { redirect_to :back, notice: "Joined Game" }
      format.js
    end
  end

  def destroy
    game = Game.find(params[:id])
    if game.users.include?(current_user)
      game.users.delete(current_user)
    end

    respond_to do |format|
      format.html { redirect_to :back, notice: "Left Game" }
      format.js
    end
  end
end
