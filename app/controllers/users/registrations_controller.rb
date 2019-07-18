class Users::RegistrationsController < Devise::RegistrationsController

  # before_action :check_recaptcha, only: %i(create)

  def new
    super
  end
  
  def expert_secondcategory
    @secondcategory = SecondCategory.where(first_category_id: params[:user][:first_category_id])
  end

  def expert_thirdcategory
    @thirdcategory = ThirdCategory.where(second_category_id: params[:user][:second_category_id])
  end
  # def create
  #   super
  # end

  def create
    #binding.pry
    if params[:user][:password] == "" #sns登録なら
      params[:user][:password] = "Devise.friendly_token.first(6)" #deviseのパスワード自動生成機能を使用
      params[:user][:password_confirmation] = "Devise.friendly_token.first(6)"
      super
      # binding.pry
      sns = SnsCredential.update(user_id:  @user.id)
    else #email登録なら
      # binding.pry
      super
    end
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
