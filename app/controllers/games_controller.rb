class GamesController < ApplicationController
  before_action :logged_in_user, only: [:destroy]

  def show
    @game = Game.find(params[:id])
    @court = @game.court
    @park = @court.park
  end

  private

    def game_params
      params.require(:game).permit()
    end
end
