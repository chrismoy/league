class GamesController < ApplicationController
  # before_action :logged_in_user, only: [:create]

  def create
    message = "Invalid time"

    if params[:time].nil?
      redirect_to root_url
      return
    end

    @time = Time.parse(params[:time])

    if @time.to_date > (Time.zone.now).to_date
      message += ", registration for this time has not opened yet"
      flash[:warning] = message
      redirect_to root_url
      return
    end

    unless @time.min % 20 == 0
      message += ", please choose a time ending in :00 or :30"
      flash[:warning] = message
      redirect_to root_url
      return
    end

    @park = Park.find(params[:park_id]);
    @court = @park.courts.first
    @game = Game.new(court: @court, time: @time);

    if @court.games.exists?(time: @time)
      message += ", there is already a game scheduled for this time, please choose another"
      flash[:warning] = message
      redirect_to root_url
      return
    end

    # @game.users << current_user
    @game.save

    redirect_to park_game_url(id: @game.id)
  end

  def show
    @game = Game.find(params[:id])
    @court = @game.court
    @park = @court.park

    @messages = Message.where(game_id: @game.id)

    players =  @game.users
    max_users = 6
    @players = []

    for i in 0...max_users do
      @players << (players[i].nil? ? User.empty_user : players[i])
    end
  end

  private

    def game_params
      params.require(:game).permit()
    end
end
