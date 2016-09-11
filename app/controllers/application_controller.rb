class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # change layout for login, register, forgot password
  layout :layout_by_resource

  protected

  def authenticate_user!(options={})
    if user_signed_in?
      super
    else
      redirect_to new_user_session_path #, :notice => 'if you want to add a notice'
      ## if you want render 404 page
      ## render :file => File.join(Rails.root, 'public/404'), :formats => [:html], :status => 404, :layout => false
    end
  end

  def layout_by_resource
    if devise_controller? && resource_name == :user && action_name == "new" || controller_path == "invitations"
      "auth"
    else
      "application"
    end
  end

end
