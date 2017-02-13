class OmniauthCallbacksController < Devise::OmniauthCallbacksController
    def facebook
        @user = User.from_omniauth(request.env["omniauth.auth"])
        puts '@@@@@', @user.errors.full_messages
        if @user.persisted?
            sign_in_and_redirect @user, :event => :authentication #this will throw if @user is not activated
            set_flash_message(:notice, :success, :kind => "Facebook") if is_navigational_format?
        else
            session['devise.facebook_data'] = request.env['omniauth.auth']
            # redirect_to root_path, 
            set_flash_message(:notice, :success, :kind => "Facebook") if is_navigational_format?
            redirect_to new_user_registration_url, error: "Error signing in with facebook credentials."
        end
    end

    def failure
        redirect_to root_path
    end
end
