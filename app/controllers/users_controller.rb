class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
  end

  def update
    @user = User.find(params[:id])
    if params[:user]
      @user.update(user_params)
    end
      redirect_to user_path
  end

  def show
    @user = User.find(params[:id])
  end

private
  def user_params
    params.require(:user).permit(:name)
  end
end
