class SessionsController < ApplicationController
  def new
  end

  def create
    #find user with that username (from form on new.html.erb)
    @user = User.find_by_username(params[:login][:username])

    if @user.nil?
      @user = User.find_by_email(params[:login][:username])
    end
    
    #password verification
    @user = @user.try(:authenticate, params[:login][:password])

    #if correct login details:
    if @user
      #set session to user id
      session[:user_id] = @user.id

      flash[:alert] = "welcome"
      redirect_to root_path

    else
      #show form again
      render "new"
    end
  end

  def destroy
  	#delete browser session data
  	reset_session

  	flash[:alert] = "you've logged out. see you later"
  	redirect_to root_path
  end
end
