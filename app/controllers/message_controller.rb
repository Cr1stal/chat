class MessageController < ApplicationController
#before_filter :auth
  def index
    @users = User.find_by_id(session[:user_id])
    @messages = Message.all( :limit => 5, :order => "created_at DESC" ).reverse
    @msg = Message.new
  end

  def new
    @message = Message.new

  end

  def refresh
    date = params[:time]
    time_date = Time.at(date.to_i+1).to_datetime
    @messages = Message.where("created_at > :date", :date => time_date);

    if @messages.nil?
      render false
    else
      render "refresh", :layout => false, :formats => :html
    end
  end

  def create
    Rails.logger.debug "#{params}"
    Rails.logger.debug "#{request}"
    user_id = session[:user_id]
    message = params[:message]

    @message = Message.new
    @message.user_id = user_id
    @message.message = message
    if @message.save
        render "create", :layout => false, :formats => :html
        flash[:notice] = "Message successfully added!"
       # redirect_to "/message/index"
    else
      if request.xhr?
        render :status => 403
      else
        flash[:error] = "Message could not be added."
        #redirect_to "/message/index"
      end
    end
  end

  protected
  def auth
    if session[:user_id].nil?
      redirect_to ("/login")
      flash[:notice] = "Please login"
    end
  end
end
