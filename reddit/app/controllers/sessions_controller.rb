class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_credential(params[:user][:username], params[:user][:passowrd])
    if user
      log_in(user)
      # redirect_to
    else
      flash[:errors] = ["Invalid password or username"]
      render :new
    end
  end

  def destroy
    log_out
    redirect_to new_session_url
  end
end
