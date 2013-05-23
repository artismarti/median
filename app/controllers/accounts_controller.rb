class AccountsController < ApplicationController
  #check for sign in
  before_filter :require_user

  def edit
  	@user = current_user
  end

  def update
  	@user = current_user
  	if @user.update_attributes(params[:user])
  		flash[:alert] = "account updated."
  	end

  	render "edit"
  end
end
