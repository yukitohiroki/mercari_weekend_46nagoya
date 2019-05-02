class Users::SessionsController < Devise::SessionsController
  # before_action :check_recaptcha, only: %i(create)

  # def create
  #   super
  # end

  # protected
  # def check_recaptcha
  #   unless verify_recaptcha
  #     self.resource = resource_class.new sign_in_params
  #     resource.validate
  #     respond_with_navigational(resource) { render :new }
  #   end
  # end
end
