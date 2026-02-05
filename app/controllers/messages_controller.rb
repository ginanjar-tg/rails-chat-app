class MessagesController < ApplicationController
  before_action :require_username

  def index
    @messages = Message.order(created_at: :asc).last(50)
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)
    @message.username = session[:username]

    respond_to do |format|
      if @message.save
        format.turbo_stream
        format.html { redirect_to messages_path }
      else
        format.html { render :index, status: :unprocessable_entity }
      end
    end
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end

  def require_username
    redirect_to new_session_path unless session[:username].present?
  end
end
