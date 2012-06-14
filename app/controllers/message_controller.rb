class MessageController < ApplicationController

  def index
    @users = User.all
    @messages = Message.all( :limit => 50 )
    @msg = Message.new
  end

  def new
    @message = Message.new

  end

  def create
    user_id = session[:user_id]
    message = params[:field_message]
    #puts params[:text]
    @message = Message.new
    @message.user_id = user_id
    @message.message = message
    if @message.save
      flash[:notice] = "Message successfully added!"
      redirect_to "/message/index"
    end
  end
end
