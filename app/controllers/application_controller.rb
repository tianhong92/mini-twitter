class ApplicationController < ActionController::Base
  protect_from_forgery

  # helper :all
  helper_method :current_user_session, :current_user

  private

  def current_user_session
    return @current_user_session if defined?(@current_user_session)
    @current_user_session = UserSession.find
  end

  def current_user
    return @current_user if defined?(@current_user)
    @current_user = current_user_session && current_user_session.record
  end

  def logged_in_required
    unless current_user
      store_location
      flash[:error] = 'You must be logged in to access this page'
      redirect_to sign_in_url
      return false
    end
  end

  def logged_out_required
    if current_user
      flash[:error] = 'You must be logged out to access this page'
      redirect_to root_url
      return false
    end
  end

  def store_location
    session[:return_to] = request.fullpath
  end

  def redirect_back_or_default(default)
    if session[:return_to]
      destination = session[:return_to]
      session[:return_to] = nil
    else
      destination = default
      session[:return_to] = nil
    end
    redirect_to(destination)
  end

  def admin_required
    unless current_user && current_user.admin?
      flash[:error] = 'You are not authorised ot do that'
      redirect_to root_url
      return false
      end
    end

    def manager_required
      unless current_user && (current_user.manager? || current_user.admin?)
        flash[:error] = 'You are not authorised to do that'
        redirect_to root_url
        return false
        end
      end

    end