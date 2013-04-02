class SessionsController < ApplicationController
  def create 
    @auth = Authorization.find_or_create_from_hash(auth_hash, current_user)
    self.current_user = @auth.user
    redirect_to_back(root_path)
  end

  def login
  end

  def logout
    self.current_user = nil
    redirect_to_back(root_path)
  end
  
  protected
 
  def auth_hash
    request.env['omniauth.auth']
  end
end
