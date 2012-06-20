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
    render :layout => "login_page"
  end
  def update_user
    @online_user = OnlineUser.find_by_user_id(session[:user_id])
    @online_user.last_activity = DateTime.now
    @online_user.save
    t = @online_user.last_activity.to_i
    t = t - 30
    @online_users = OnlineUser.where("? < last_activity", Time.at(t).to_datetime)
    render "update_user", :layout => false, :formats => :html
  end
  def create
    @user = User.create(params[:user])

    respond_to do |format|
      if @user.save
        session[:user_id] = @user.id
        @online_user = OnlineUser.new
        @online_user.last_activity= @user.created_at
        @online_user.user_id = @user.id
        @online_user.save
        flash[:notice] = "#{@user.username.capitalize} successfully login"
        format.html { redirect_to("/message/index") }
      else
        flash[:error] = "Please login again"
        format.html { render :action => "login" }
      end
    end
  end
end
