class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :require_login, :assign_current_user


  def render404
    render :file => File.join(Rails.root, 'public', '404.html'), :status => 404, :layout => false
    return true
  end

  private

  def require_login
    unless (current_user || logging_in_or_signing_up)
      redirect_to new_user_session_path
    end
  end

  def logging_in_or_signing_up
    request.env['PATH_INFO'] == new_user_session_path || request.env['PATH_INFO'] == new_user_registration_path || (request.env['PATH_INFO'] == '/users' && params[:"commit"] == "Sign up")
  end

  def assign_current_user
    @current_user = current_user
  end

end
