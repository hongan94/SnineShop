class Admin::SessionsController < Devise::SessionsController
# before_action :configure_sign_in_params, only: [:create]
  layout 'login_logout'
  # GET /resource/sign_in
  def new
    @user = User.new
    @admin = Admin.new
  end

  # POST /resource/sign_in
  def create
    @admin = Admin.find_by(email: params[:admin][:email])
    sign_in @admin
    redirect_to categories_path
  end

  def destroy
    @admin = Admin.find(params[:admin][:id])
    sign_out @admin
    redirect_to categories_path
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
