class Users::RegistrationsController < Devise::RegistrationsController

  # before_action :check_recaptcha, only: %i(create)

  def new
    super
  end

  def create
    super
  end

  private
    def check_recaptcha
      unless verify_recaptcha
        self.resource = resource_class.new sign_up_params
        resource.validate
        respond_with_navigational(resource) { render :new }
    end
  end
end
