class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  private
    def authorize_admin!
        require_login!
        unless current_user.admin?
            flash[:alert] = "Debes loggearte como administrador para hacer eso."
            redirect_to root_path
      end
    end
  def require_login!
  		if current_user.nil?
  			flash[:error] = "Necesitas loggearte para continuar."
  			redirect_to login_url
  		end
  end
  helper_method :require_login!

  def current_user
  		@current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user
end
