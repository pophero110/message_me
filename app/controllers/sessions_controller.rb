class SessionsController < ApplicationController
  before_action :logged_in_redirect, only: [:new, :create]
  after_action :welcome_message, only: [:create]

  def new
  end

  def create
    user = User.find_by(username: params[:session][:username])
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:success] = "You have successfully logged in"
      redirect_to(root_path)
      return
    else
      flash.now[:error] = "There was soemthinmg wrong with your login information"
      render "new"
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = "You have successfully logged out"
    redirect_to login_path
  end

  private

  def logged_in_redirect
    if logged_in?
      flash[:error] = "You have already logged in"
      redirect_to root_path
    end
  end

  def welcome_message
    ActionCable.server.broadcast "chatroom_channel", mod_message: message_render("Everyone welcome #{current_user.username}")
  end

  def message_render(message)
    # render(partial: "message", locals: { message: message })
    MessagesController.render(partial: "message", locals: { message: message })
  end
end
