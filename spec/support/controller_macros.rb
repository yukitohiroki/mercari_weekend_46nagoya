module ControllerMacros
  def login(user)
    @request.env["devise.mapping"] = Devise.mappings[:user]
    sign_in user
  end

  def login_admin(admin)	
    @request.env["devise.mapping"] = Devise.mappings[:admin]	
    sign_in admin	
  end
end

