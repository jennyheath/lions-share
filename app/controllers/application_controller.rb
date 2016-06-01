class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user, :signed_in?

  private
  def current_user
    @current_user ||= User.find_by_session_token(session[:session_token]);
  end

  def require_no_user!
    if request.path === '/admin' && current_user.nil?
      redirect_to :controller => 'sessions', :action => 'new'
    elsif request.path === '/admin'
      redirect_to admin_listings_url
    else
      redirect_to root_url
    end
  end

  def require_signed_in!
    redirect_to root_url unless signed_in?
  end

  def signed_in?
    !!current_user
  end

  def sign_in(user)
    @current_user = user
    session[:session_token] = user.reset_token!
  end

  def sign_out
    # debugger
    current_user.reset_token!
    session[:session_token] = nil
  end
end
