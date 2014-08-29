class CheatsheetsController < ApplicationController

  def index
    @user = User.find(params[:user_id])
    @cheatsheets = Cheatsheet.all
  end

  def show
    ## BUG BUG ! show page is for 1 cheatsheet - seems like you are trying for an index action here  # =>  doesn't yet work -but something along these lines
    @user = User.find(params[:user_id])
    @cheatsheet = Cheatsheet.find(params[:cheatsheet_id])
  end

  def create
    @user = User.find(session[:user_id])
    @cheatsheet = Cheatsheet.create(cheatsheet_params)
    @user.cheatsheets << @cheatsheet
    redirect_to user_path(@user) # =>  show  all user's cheatsheets with the index partial, from shared
  end

  def new
    @user = User.find(session[:user_id])
    @cheatsheet = Cheatsheet.new
  end

  def edit
    @cheatsheet = Cheatsheet.find(params[:id])
    redirect_to user_cheatsheet_path
  end

  def update
    # @cheatsheet = Cheatsheet.find(params[:id])
    # @cheatsheet.update(cheatsheet_params)
    # redirect_to user_cheatsheet_path
  end

  def destroy
    cheatsheet = Cheatsheet.find(params[:id])
    cheatsheet.destroy
    redirect_to user_cheatsheets_path
  end

  private
    def cheatsheet_params
      params.require(:cheatsheet).permit(:name)
    end
end
