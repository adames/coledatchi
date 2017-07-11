class SessionsController < ApplicationController

  def new
    @user
  end

  def create
    #lets look up a user
    @user = User.find_by(email: params[:email])
    if @user  && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to user_path(@user)
      # let them in redirect_to some page
    else
      # couldnt log in
      render :new
    end

  end


  def destroy
    session[:user_id] = nil
    redirect_to login_path
  end



end
