class AuthenticationController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(email: params[:email])
    if @user and @user.authenticate(params[:password])
      session[:user_id] = @user.id
      flash[:notice] = "you've logged in"
      redirect_to root_path
    else
      flash[:notice] = "something is f'd up"
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "you've logged out"
    redirect_to root_path
  end

end
