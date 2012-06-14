class SessionsController < ApplicationController
  def new
  end

  def create
    if user = params[:user]
      redirect_to ( "/message/index" )
    else
      redirect_to ("/user/login")
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to ("/user/exit")
  end
end
