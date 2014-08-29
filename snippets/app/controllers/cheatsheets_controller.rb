class CheatsheetsController < ApplicationController

  def index

  end

  def show
    @user = User.find(params[:user_id])
    @cheatsheets = @user.cheatsheets.all
  end

  def create

  end

  def new

  end

  def edit

  end

  def update

  end

  def destroy

  end
end
