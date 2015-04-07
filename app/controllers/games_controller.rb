class GamesController < ApplicationController
  before_action :logged_in_user, only: [:destroy]

  def create
    @park = Park.find(params[:court]);
    @court = @park.courts.first
    Game.create(court: @court, time: params[:time]);
  end

  def show
    @game = Game.find(params[:id])
    @court = @game.court
    @park = @court.park
    @messages = Message.where(game_id: @game.id)
  end

  private

    def game_params
      params.require(:game).permit()
    end
end
