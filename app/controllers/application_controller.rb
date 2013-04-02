class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_user, :signed_in?, :is_me?
  layout Proc.new { |c| c.request.xhr? ? false : 'application' }
  
  def current_user
    begin
      @current_user ||= (session[:user_id] && User.find_by_id!(session[:user_id]))
    rescue ActiveRecord::RecordNotFound
      nil
    end 
  end

  def current_user=(user)
    @current_user = user
    if user.nil?
      session[:user_id] = nil
    else
      session[:user_id] = user.id
    end
  end

  def signed_in?
    !!current_user
  end 

  def is_me?(u)
    signed_in? and current_user == u
  end

  def require_login
    redirect_to login_path unless signed_in?
  end
  
  def require_admin_rights
    unless signed_in? && current_user.has_admin_rights?
      redirect_to_404      
    end
  end

  def render_not_found
    respond_to do |format|
      format.json { render :nothing => true, :status => 404 }
      format.html { render 'shared/not_found', :status => 404 }
    end
    true
  end

  def render_forbidden
    respond_to do |format|
      format.json { render :nothing => true, :status => 403 }
      format.html { render 'shared/forbidden', :status => 403 }
    end
    true
  end

  def redirect_to_stored
    if return_to = session[:return_to]
      session[:return_to] = nil
      redirect_to return_to
    else
      redirect_to '/'
    end
  end

  def redirect_to_back(default = root_path)
    redirect_to :back
  rescue ActionController::RedirectBackError
      redirect_to default
  end

end
