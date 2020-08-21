class Users::RegistrationsController < Devise::RegistrationsController
  before_action :authenticate_user!, only: :show

   def new
     @user = User.new
   end

  def after_sign_up_path_for(resource)
    "/users/#{current_user.id}"
  end
end
