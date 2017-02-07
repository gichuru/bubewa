class OmniauthCallbacksController < Devise::OmniauthCallbacksController
	def facebook
		@user = User.from_omniauth(request.env["omniauth.auth"])
	    if @user && @user.save
	      sign_in_and_redirect @listing #this will throw if @user is not activated
	      set_flash_message(:notice, :success, :kind => "facebook") if is_navigational_format?
	    else
	      redirect_to root_path, error: "Error signing in with facebook credentials."
	    end
	end
end
