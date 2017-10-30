class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  # # helper_method :login
  helper_method :current_user
  helper_method :logged_in?
  helper_method :logout
  #
  # def login
  #
  # end

  def current_user
    return nil if !session[:session_token]
    @current_user ||= User.find_by(session_token: session[:session_token])
  end

  def logged_in?
    !!current_user
  end

  def log_in_user!(user)
    session[:session_token] = user.ensure_session_token
  end

  def logout
    if logged_in?
      current_user.reset_session_token!
      session[:session_token] = nil
    end
    redirect_to users_url
  end
end
