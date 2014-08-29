class CheatsheetsController < ApplicationController

  def index

  end

  def show
    @user = User.find(params[:user_id])
    @cheatsheets = @user.cheatsheets.all
  end

  def create
    @user = User.find(params[:user_id])
    @cheatsheet = Cheatsheet.create(cheatsheet_params)
    redirect_to user_cheatsheet_path
  end

  def new
    @cheatsheet = Cheatsheet.new
  end

  def edit
    @cheatsheet = Cheatsheet.find(params[:id])
  end

  def update
    @cheatsheet = Cheatsheet.find(params[:id])
    @cheatsheet.update(cheatsheet_params)
    redirect_to user_cheatsheet_path
  end

  def destroy

  end

  private
    def cheatsheet_params
      params.require(:cheatsheet).permit(:name)
    end
end
