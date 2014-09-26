class SessionController < ApplicationController
  def new
    @search = Snippet.search(params[:q])
    @user = User.new
  end

  def create
    @search = Snippet.search(params[:q])
    @user = User.find_by_email(params[:email])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to snippets_path
    else
      @errors = "Invalid username or password"
      render 'new'
    end
  end

  def destroy
    session.clear
    redirect_to root_path
  end
end
