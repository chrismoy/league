class SessionsController < ApplicationController

  def new
  end

  def create
    if params[:provider].nil?
      user = User.find_by( email: params[:session][:email].downcase)
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
      unless params[:provider] == 'twitter'
        if User.find_by(email: auth_hash.info.email)
          flash.now[:danger] = 'The email address associated with this account is already in use'
          render 'new'
          return
        end
      end
      user = User.find_or_create_from_auth_hash auth_hash
      log_in user
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
