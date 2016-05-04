class RegistrationsController < Devise::RegistrationsController

  private

  def account_update_params
    params.require(:user).permit(:user_name, :email, :password, :password_confirmation, :current_password, :avatar, :avatar_cache, :remove_avatar)
  end
end
