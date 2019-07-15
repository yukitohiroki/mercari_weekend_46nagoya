class ApplicationController < ActionController::Base
  before_action :basic_auth, if: :production?
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_search
  protect_from_forgery with: :exception

  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname,:first_name,:first_name_kana,:last_name,:last_name_kana,:prefecture_id,:city,:address,:building,:zip_code,:telephone,:birth_year,:birth_month,:birth_day,:expert_or_ordinary, :company, :job, :position, :work_year, :first_category_id, :second_category_id, :third_category_id])
  end

  def production?
    Rails.env.production?
  end

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == "mercari" && password == "2019"
    end
  end

  def set_search
    @search = Item.ransack(params[:q]) #ransackメソッド推奨
    @search_items = @search.result.page(params[:page])
  end
end
