class UsersController < ApplicationController


  def index
    @users = User.all
    if session[:user_id]
      @current_user = User.find(session[:user_id])
    else
    end
  end


  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to root_path
    else
      render :new
    end
  end


  private
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

end

end
