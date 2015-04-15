class GamesController < ApplicationController
  before_action :logged_in_user, only: [:create]

  def create
    unless params[:game][:time].min % 30 == 0
      redirect_back_or

    @park = Park.find(params[:park_id]);
    @court = @park.courts.first
    @game = Game.create!(court: @court, time: params[:game][:time]);
    @game.users << current_user

    redirect_to park_game_url(id: @game.id)
  end

  def show
    @game = Game.find(params[:id])
    @court = @game.court
    @park = @court.park

    @messages = Message.where(game_id: @game.id)

    players =  @game.users
    @away_players = []
    @home_players = []
    for i in 0..(players.length - 1) do
      i.even? ? @away_players << players[i] : @home_players  << players[i]
    end
  end

  private

    def game_params
      params.require(:game).permit()
    end
end
