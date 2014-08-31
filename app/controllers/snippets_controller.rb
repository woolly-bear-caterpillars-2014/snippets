class SnippetsController < ApplicationController
	def index
		if params[:search]
      @snippets = Snippet.search(params[:search]).order("created_at DESC")
    else
      @snippets = Snippet.all
    end
		@snippet = Snippet.new
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
			tag_list = Tag.create_tags(params[:tag_list])
			p tag_list
		  tag_list.each do |tag_id|
		    @snippet.snippet_tags.create(tag_id: tag_id)
		  end
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
			tag_list = Tag.create_tags(params[:tag_list])
			p tag_list
		  tag_list.each do |tag_id|
		    @snippet.snippet_tags.create(tag_id: tag_id)
		  end
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
		params.require(:snippet).permit(:title, :code, :language)
	end
end
