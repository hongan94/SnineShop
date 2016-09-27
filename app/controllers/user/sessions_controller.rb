class User::SessionsController < Devise::SessionsController
# before_action :configure_sign_in_params, only: [:create]
  # GET /resource/sign_in
  # def new
  #   super
  # end
  layout 'login_logout'
  # POST /resource/sign_in
  def create
    @user = User.find_by(email: params[:email])
    if @user
      sign_in @user
      redirect_to root_path
    end
    redirect_to new_user_session_path
  end


  def destroy
    sign_out current_user
    redirect_to root_path
  end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
