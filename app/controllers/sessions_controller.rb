class SessionsController < ApplicationController

  # this controller doens't do CRUD actions
  # so the methods are quite different
  def new
  end

  def create

    user = User.find_by(email: params[:email])
    # find a user by email and then authenticate using the password provided

    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to movies_path, notice: "Welcome back, #{user.firstname}!"
    else
      flash.now[:user_id] = "Log in failed..."
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to movies_path, notice: "Adios!"
  end
end
