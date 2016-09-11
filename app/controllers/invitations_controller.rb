class InvitationsController < Devise::InvitationsController
	private

	def resource_params
		params.require(:user).permit(:email, :password, :password_confirmation, :avatar, :handle)
  end

end
