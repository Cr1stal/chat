class UserController < ApplicationController
  def index
  end

  def exit
    @user = User.find_by_id(session[:user_id])
    @user.active_user = false
    @user.save
    session[:user_id] = nil
    flash[:notice] = "You are log out"
    redirect_to("/user/login")
  end

  def login
    #redirect_to ("/message/index") unless session[:user_id].nil?
    @user = User.new
  end

  def create
    @user = User.create(params[:user])

    respond_to do |format|
      if @user.save
        session[:user_id] = @user.id
        flash[:notice] = "User successfully added"
        format.html { redirect_to("/message/index") }
      else
        flash[:error] = "Please login again"
        format.html { render :action => "login" }
      end
    end
  end
end
