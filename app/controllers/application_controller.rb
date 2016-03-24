class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def user_login_required
      if current_user.nil?
        flash[:notice]= "please login to view the content"
        redirect_to "/usersession/sign_in"
      end
    end

    def current_user
      User.find_by_id(session[:user_id])
    end
end
