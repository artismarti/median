class UserCommentsController < ApplicationController
	before_filter :require_user

	def create
		@post = Post.find_by_url(params[:post_id])

		@comment = @post.comments.new(params[:comment])
		@comment.user = current_user

		if @comment.save
			flash[:alert] = "thanks for your comment"
		else
			flash[:error] = "please say something first"
		end

		redirect_to post_path(@post)
	end
	

end
