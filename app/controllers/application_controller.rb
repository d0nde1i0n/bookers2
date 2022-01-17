class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters,if: :devise_controller?
  before_action :authenticate_user!, except: [:top,:about]

  # サインアップ後の遷移先の指定
  def after_sign_up_path_for(resource)
    user_path(current_user.id)
  end

  # サインイン後の遷移先の指定
  def after_sign_in_path_for(resource)
    user_path(current_user.id)
  end

  # サインアウト後の遷移先の指定
  def after_sign_out_path_for(resource)
    root_path
  end

  class ApplicationController < ActionController::Base
    add_flash_types :success, :info, :warning, :danger
  end

  protected

  def configure_permitted_parameters
    # emailというデータが保存可能となるように許可
    devise_parameter_sanitizer.permit(:sign_up,keys: [:email])
  end

end

