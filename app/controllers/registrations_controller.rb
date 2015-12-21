class RegistrationsController < Devise::RegistrationsController

	private

	def sign_up_params
		params.require(:user).permit(:email, :password, :time_zone)
	end

	def account_update_params
		params.require(:user).permit(:email, 
		:password, 
		:current_password, 
		:first_name, 
		:last_name,
		:handle, 
		:telephone, 
		:time_zone
		)
	end

end