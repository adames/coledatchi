class UsersController < ApplicationController

  def home
    if session[:user_id]
      redirect_to user_path(current_user)
    end
  end


  def show
    @user = current_user
    # @user = params[:id] This is only for testing
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      render :new
    end
  end


  private
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end



end
