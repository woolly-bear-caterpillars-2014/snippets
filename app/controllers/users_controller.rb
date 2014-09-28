class UsersController < ApplicationController

  def index
    redirect_to root_path
  end

  def show
    @search_by_title = Snippet.search(params[:q])
    @user = User.find(params[:id])
    @cheatsheets = @user.cheatsheets.all
    @snippets = @user.cheatsheets.first.snippets
    @tags = []
    @snippets.each do |snippet| 
      snippet.tags.each do |tag| 
        @tags << tag.title
      end
    end
    @tags.uniq!
  end

  def new
    @search_by_title = Snippet.search(params[:q])
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      @user.cheatsheets << Cheatsheet.create(name: "New Cheatsheet")
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      redirect_to new_user_path
    end
  end

  def edit
    @search_by_title = Snippet.search(params[:q])
    if session[:user_id] == params[:id].to_i
      @user = User.find(params[:id])
    else
      redirect_to root_path
    end
  end

  def update
    @search_by_title = Snippet.search(params[:q])
    @user = User.find(params[:id])

    if @user.update(user_params)
      redirect_to user_path
    else
      render 'edit'
    end
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    session.clear
    @user = User.new
    redirect_to root_path
  end

  private

    def user_params
      params.require(:user).permit(:email, :password)
    end
end
