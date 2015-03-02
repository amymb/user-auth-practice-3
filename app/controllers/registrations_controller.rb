class RegistrationsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(params.require(:user).permit(:email, :password, :password_confirmation))
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "You've signed up!"
      redirect_to root_path
    else
      flash[:notice] = "Something went wrong"
      render :new
    end
  end
end
