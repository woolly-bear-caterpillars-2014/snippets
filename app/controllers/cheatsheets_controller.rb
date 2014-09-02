class CheatsheetsController < ApplicationController

  before_action :load_user_from_param, only: [:index, :show, :create, :add_snippet, :remove_snippet]

  def index
    @cheatsheets = Cheatsheet.all
  end

  def show
    @cheatsheets = @user.cheatsheets.find(params[:id])
  end

  def create
    @cheatsheet = Cheatsheet.create(cheatsheet_params)
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
    # @cheatsheet = Cheatsheet.find(params[:id])
    # @cheatsheet.update(cheatsheet_params)
    # redirect_to user_cheatsheet_path
  end

  def add_snippet
    @snippet = Snippet.find(params[:id])
    @user.cheatsheets.first.snippets << @snippet
    @snippet.increment!(:snip_count)
    redirect_to root_path
  end

  def remove_snippet
    @snippet = Snippet.find(params[:id])
    @user.cheatsheets.first.cheatsheet_snippets.find_by_snippet_id(@snippet.id).destroy
    @snippet.decrement!(:snip_count)
    redirect_to user_path(user.id)
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

  def load_user_from_param
    @user = User.find(params[:user_id])
  end



end
