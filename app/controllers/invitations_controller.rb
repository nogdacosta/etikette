class InvitationsController < Devise::InvitationsController

	before_filter :update_sanitized_params, only: :update

	# PUT /resource/invitation
  def update
    respond_to do |format|
      format.js do
        invitation_token = Devise.token_generator.digest(resource_class, :invitation_token, update_resource_params[:invitation_token])
        self.resource = resource_class.where(invitation_token: invitation_token).first
        resource.skip_password = true
        resource.update_attributes update_resource_params.except(:invitation_token)
      end
      format.html do
        super
      end
    end
  end

	private

	def update_sanitized_params
    params.require(:user).permit(:email, :password, :password_confirmation, :avatar, :handle)
  end

end
