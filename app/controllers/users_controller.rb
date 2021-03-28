class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def index
    @users = User.all
  end

  def create
    user = User.new(user_params)
    if user.save
      flash[:success] = "Your account has been successfully created!"
      redirect_to login_path
    else
      flash[:error] = "Oops something went wrong"
      render "new"
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end
end
