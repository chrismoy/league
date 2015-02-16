class GamesController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]

  def create
    @game = current_user.games.build(game_params)
    if @game.save
      flash[:success] = "Game created!"
      redirect_to root_url
    else
      render 'main_pages/home'
    end
  end

  def show
    @game = Game.find(params[:id])
    @court = @game.court
    @park = @court.park
  end

  def index
  end

  def destroy
  end

  private

    def game_params
      params.require(:game).permit(:time)
    end
end

# @game.users << current_user
