class SessionController < ApplicationController
  def new
  end

  def create
    @user = User.find_by_email(params[:email])
    if @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to "/users/#{@user.id}"
    else
      redirect_to 'new'
    end
  end

  def destroy
    session.clear
    redirect_to users_login_path
  end
end
