class ApplicationController < ActionController::Base

  def log_in(user)
    session[:session_token] = user.reset_session_token!
    @current_user = user
  end

  def log_out
    current_user.reset_session_token!
    session[:session_token] = nil
  end

  def require_login
    redirect_to new_session_url unless logged_in?
  end

  def logged_in?
    !!current_user
  end

  def current_user
    user ||= User.find_by_session_token(session[:session_token])
  end
end
