class UsersessionController < ApplicationController
  def sign_in
  	@user = User.new
  end

  def create
  	user = User.where("email = ? and password = ?",params[:email],params[:password]).first
  	if user.present?
  		flash[:notice] = "Successfully logged in"
  		session[:user_id] = user.id
  		redirect_to posts_path
  	else
  		flash[:error] = "Invalid email or password"
  		render :action => "sign_in"
  	end
  end

  def sign_out
  	session[:user_id]= nil
  	redirect_to :action => 'sign_in'
  end
end
