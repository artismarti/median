class LikesController < ApplicationController
	
	before_filter :require_user
	before_filter :find_post

	def create
		unless current_user == @post.user
			@post.likes.create(user_id: current_user.id)
			flash[:alert] ="you liked this post."
		else
			flash[:error] ="you're so vain."
		end
		redirect_to post_path(@post)
	end

	def destroy
		@post.likes.where(user_id: current_user.id).destroy_all

		flash[:alert] ="you unliked this post. wtf!"
		redirect_to post_path(@post)
	end

	def find_post
		@post = Post.find_by_url(params[:post_id])
	end

	
end
