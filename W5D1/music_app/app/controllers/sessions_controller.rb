class SessionsController < ApplicationController
  def new
    #login page
    render :new
  end

  def create
    #login action
    if user = User.find_by_credentials(params[:users][:email], params[:users][:password])
      #TODO: login in helper
      log_in_user!(user)
      redirect_to user_url(user.id)
    else
      flash.now[:login_error] = "invalid"
      render :new
    end
  end

  def destroy
    #logout action
    logout
  end
end
