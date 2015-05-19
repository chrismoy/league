class UserMailer < ApplicationMailer

  def account_activation(user)
    @user = user
    mail to: user.email, subject: "Account activation"
  end

  def password_reset(user)
    @user = user
    mail to: user.email, subject: "Password reset"
  end

  def game_notification(user, game)
    @user = user
    @game = game
    mail to: user.email, subject: "Game at #{game.time.strftime("%-I:%M%p")} at #{game.court.park}"
  end
end
