# frozen_string_literal: true

class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    callback_for(:facebook)
  end

  def google_oauth2
    callback_for(:google)
  end

  def callback_for(provider)
    auth = request.env["omniauth.auth"]
    user = User.find_by(email: auth.info.email)
    if user.present?
       @user = SnsCredential.find_for_auth(auth, user)
        sign_in_and_redirect @user, event: :authentication
    elsif user.blank?
      @user = SnsCredential.create_user(auth)
      sign_in_and_redirect @user, event: :authentication
    else
      session["devise.#{provider}_data"] = request.env["omniauth.auth"].except("extra")
      redirect_to new_user_registration_path
    end
  end
end
