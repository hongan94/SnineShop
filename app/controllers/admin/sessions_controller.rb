class Admin::SessionsController < Devise::SessionsController
# before_action :configure_sign_in_params, only: [:create]
  layout 'login_logout'
  # GET /resource/sign_in
  skip_before_filter :require_no_authentication
  def new
    @user = User.new
    @admin = Admin.new
  end

  # POST /resource/sign_in
  def create
    @admin = Admin.find_by(email: params[:admin][:email])
    sign_in @admin
    redirect_to admin_categories_path(current_admin)
  end

  def destroy
    sign_out current_admin
    redirect_to new_admin_session_path
  end
  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
