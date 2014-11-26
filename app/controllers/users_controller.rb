class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id # auto log in
      redirect_to movies_path, notice: "Welcome aboard, #{@user.firstname}!"
    else
      
      render :new
    end
  end

  protected

  def user_params
    params.require(:user).permit(
      :email,
      :firstname, 
      :lastname, 
      :password, 
      :password_confirmation
    )

    # in User model, has_secure_password 
    # adds virtual password and password_confirmation attributes
    # which are also present in user_params
  end
end
