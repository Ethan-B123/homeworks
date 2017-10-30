class UsersController < ApplicationController

  def index
    @users = User.all
    render :index
  end

  def show
    @user = User.find_by(id: params[:id])
    redirect_to users_url if !@user
    render :show
  end

  def create
    user = User.new(user_params)
    user.password = params[:users][:password]
    user.save
    log_in_user!(user)
    redirect_to user_url(user.id)
  end

  def new
    render :new
  end

  private

  def user_params
    params.require(:users).permit(:email, :password)
  end
end
