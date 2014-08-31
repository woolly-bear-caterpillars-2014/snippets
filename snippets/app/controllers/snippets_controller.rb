class SnippetsController < ApplicationController
	def index
		if params[:search]
			puts 'test'
      puts params[:search] 
      @snippets = Snippet.search(params[:search]).order("created_at DESC")
    else
      @snippets = Snippet.all
    end
		@snippet = Snippet.new
		@user = User.find(session[:user_id])
		@cheatsheet = @user.cheatsheets.first || @user.cheatsheets.create!
	end

	def show
		@snippet = Snippet.find(params[:id])
	end

	def new
		@snippet = Snippet.new
	end

	def create
		@user = User.find(session[:user_id])
		@snippet = @user.snippets.create(snippet_params)
		if @snippet.save
			redirect_to snippets_path
		else
			redirect_to new_snippet_path
		end
	end

	def edit
		@snippet = Snippet.find(params[:id])
	end

	def update
		@snippet = Snippet.find(params[:id])
		@snippet.update(snippet_params)
		if @snippet.save
			redirect_to snippet_path(@snippet)
		else
			redirect_to edit_snippet_path(@snippet)
		end
	end

	def destroy
		@snippet = Snippet.find(params[:id])
		@snippet.destroy
		redirect_to root_path
	end

	private
	def snippet_params
		p params.inspect
		params.require(:snippet).permit(:title, :code, :language)
	end
end
