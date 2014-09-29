class SnippetsController < ApplicationController
	def index	
		@search_by_title = Snippet.search(params[:q])
		@search_by_tags = Tag.search(params[:q])

		if @search_by_title || @search_by_tags
			@snippets = []
			
			@results_by_title = @search_by_title.result(distinct: true)
			@results_by_tags = @search_by_tags.result(distinct: true)
			
			@results_by_title.each{ |snippet| @snippets << snippet }
			@results_by_tags.each do |tag|
				tag.snippets.each do |snippet| @snippets << snippet
				end
			end
			@snippets.uniq!
	    else
	    	@snippets = Snippet.all.order("created_at DESC")
	    end

	    @snippet = Snippet.new
	end

	def show
		@search_by_title = Snippet.search(params[:q])
		@user = User.find(session[:user_id])
		redirect_to user_path(@user)
	end

	def new
		if session[:user_id]
			@search_by_title = Snippet.search(params[:q])
			@snippet = Snippet.new
		else
			redirect_to users_login_path
		end
	end

	def create
		@user = User.find(session[:user_id])
		@snippet = @user.snippets.create(snippet_params)
		if @snippet.save
			tag_list = Tag.create_tags(params[:tag_list])
		  	tag_list.each do |tag_id|
		    	@snippet.snippet_tags.create(tag_id: tag_id)
		  	end
			redirect_to snippets_path
		else
			redirect_to snippets_path
		end
	end

	def edit
		@search_by_title = Snippet.search(params[:q])
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
