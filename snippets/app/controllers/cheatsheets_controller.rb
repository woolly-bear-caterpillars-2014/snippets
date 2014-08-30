class CheatsheetsController < ApplicationController

  def index
    @user = User.find(params[:user_id])
    @cheatsheets = Cheatsheet.all
  end

  def show
    @user = User.find(params[:user_id])
    @cheatsheets = @user.cheatsheets.find(params[:id])
  end

  def create
    @user = User.find(params[:user_id])
    @cheatsheet = @user.cheatsheets.create(cheatsheet_params)
    redirect_to user_cheatsheet_path
  end

  def new
    @cheatsheet = Cheatsheet.new
  end

  def edit
    @cheatsheet = Cheatsheet.find(params[:id])
    redirect_to user_cheatsheet_path
  end

  def update
    @user = User.find(session[:user_id])
    @cheatsheet = @user.cheatsheets.first ||= @user.cheatsheets.create
    @snippet = Snippet.find(params[:snippet_id])
    @cheatsheet.snippets << @snippet
    @cheatsheet.save
  end

  def snip
  
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

    def snippet_params
      params.require(:snippet).permit(:snippet_id)
    end
end
