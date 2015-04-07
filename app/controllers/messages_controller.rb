class MessagesController < ApplicationController
  def create
    @message = Message.create!( user: current_user,
                                game: Game.find(params[:message][:game_id]),
                                content: params[:message][:content])

    respond_to do |format|
      format.js
    end
  end

  private

    def user_params
      params.require(:message).permit(:game_id, :content)
    end
end
