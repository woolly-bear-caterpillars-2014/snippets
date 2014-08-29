class SnippetsController < ApplicationController
	def index
		@snippets = Snippet.all
		@snippet = Snippet.new
		@user = User.find(session[:user_id])
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

	def snippet_params
		params.require(:snippet).permit(:title, :code)
	end
end