class SessionsController < ApplicationController
  def new
    redirect_to messages_path if session[:username].present?
  end

  def create
    if params[:username].present?
      session[:username] = params[:username].strip
      redirect_to messages_path
    else
      flash.now[:alert] = "Username is required"
      render :new, status: :unprocessable_entity
    end
  end
end
