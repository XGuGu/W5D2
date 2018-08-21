class ApplicationController < ActionController::Base

  helper_method :logged_in?, :current_user

  def log_in(user)
    session[:session_token] = user.reset_session_token!
    @current_user = user
  end

  def log_out
    current_user.reset_session_token!
    session[:session_token] = nil
  end

  def current_user
    user ||= User.find_by_session_token(session[:session_token])
  end

  def logged_in?
    !!current_user
  end

  def require_log_in
    redirect_to new_session_url unless logged_in?
  end

end
