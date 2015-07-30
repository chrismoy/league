class SessionsController < ApplicationController

  def new
  end

  def create
    @email = params[:email].downcase if params[:email]
    if auth_hash.nil?
      user = User.find_by(email: @email)
      if user && user.authenticate(params[:session][:password])
        if user.activated?
          log_in user
          params[:session][:remember_me] == '1' ? remember(user) : forget(user)
          redirect_back_or root_url
        else
          message = "Account not activated. "
          message += "Check your email for the activation link"
          flash[:warning] = message
          redirect_to root_url
        end
      else
        flash.now[:danger] = 'Invalid email/password combination'
        render 'new'
      end
    else
      byebug
      @social = SocialAccount.find_or_create_from_auth_hash auth_hash
      user = User.find @social.user_id
        if user
          log_in user
        else
          message = "Turn down"
          flash[:warning] = message
          redirect_to root_url
        end
      redirect_to root_url
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end

  protected

    def auth_hash
      request.env['omniauth.auth']
    end
end
