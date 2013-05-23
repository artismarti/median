class UsersController < ApplicationController
  def show
  	@user = User.find_by_username(params[:id])
  end

  def new
  	@user = User.new
  end

  def create
  	@user = User.new(params[:user])

	if @user.save
		#Session stuff for browser
		session[:user_id] = @user.id
		
		flash[:alert] = "Yay! You've signed up for spam"
		redirect_to root_path
	else
		#if not valid, then show form again
		render "new"
	end

  end
end
