class GameParticipationsController < ApplicationController
  def update
    game = Game.find(params[:id])
    unless game.users.include?(current_user) || game.users.count >= 6
      game.users << current_user
    end
    redirect_to game_url
  end

  def destroy
    game = Game.find(params[:id])
    if game.users.include?(current_user)
      game.users.delete(current_user)
    end
    redirect_to game_url
  end
end
