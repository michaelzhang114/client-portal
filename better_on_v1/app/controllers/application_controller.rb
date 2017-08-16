class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  helper_method :current_profile, :logged_in?, :current_organization
  
  
  
  def current_profile
    @current_profile ||= Profile.find(session[:profile_id]) if session[:profile_id]
  end
  
  def current_organization
    @current_organization ||= Organization.find(Profile.find(session[:profile_id]).organization_id) if session[:profile_id]
  end
  
  def logged_in?
    !!current_profile
  end
  
  def require_admin
    if !current_profile.admin?
      flash[:danger] = "you are not admin"
      redirect_to root_path
    end
  end
  
  def require_profile
    if !logged_in?
      flash[:danger] = "you're not logged in"
      redirect_to root_path
    end
  end
  
  
end
