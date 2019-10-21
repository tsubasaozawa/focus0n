class ApplicationController < ActionController::Base

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :nickname])  # ※1
  end
end

# ※1：deviseの初期状態ではサインアップ時にメールアドレスとパスワードのみを受け取るようにストロングパラメーターが設定されているため、
# 追加のパラメーターを許可したい場合は、application_controller.rbにおいてbefore_actionにconfigure_permitted_parametersメソッドを設定。